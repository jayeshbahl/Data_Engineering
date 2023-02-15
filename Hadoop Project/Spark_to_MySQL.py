import pyspark
from pyspark.sql.session import SparkSession
from pyspark.sql.functions import *
from os import *

spark = SparkSession.builder.appName("Hive_Spark").master("local[*]").enableHiveSupport().getOrCreate()  # Spark 2.x

spark.sparkContext.setLogLevel("ERROR")

spark.sql("use test1")

df = spark.sql("select * from weblog_Dynamicpart_sqoop_internal order by id")

df.show()

df1=df.groupBy(['host','ipaddress']).agg({'responsecode':'sum','url':'count'})\
    .withColumnRenamed("sum(responsecode)","Total_ResponseCode")\
    .withColumnRenamed("count(url)","Total_URL")
 
df1.show()

sqlproperties = {"user": "root", "password": "root", "driver": "com.mysql.cj.jdbc.Driver"}

print("\n", "Mysql Ingestion started", "\n")

df1.write.jdbc(url="jdbc:mysql://localhost:3306/test1", table="hive_agg", mode="overwrite", properties=sqlproperties)