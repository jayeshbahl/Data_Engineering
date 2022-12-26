import pandas as pd
import os
import pymysql
from sqlalchemy import create_engine


#get password from environmnet var
pwd = os.environ['SQLPASS']
Suid = os.environ['SQLUID']
Puid = os.environ['PGUID']
server = "localhost"


#Extracting data from MySQL
def extract():
    try:
        dbcon = pymysql.connect(host="localhost", user=Suid, password=pwd, database="bowlingleaguedb")
        tables = pd.read_sql_query("""show tables""",dbcon, parse_dates=True)
        table_list = tables.values.tolist()
        for tbl in table_list:
            # query and load save data to dataframe
            df = pd.read_sql_query(f'select * FROM {tbl[0]} LIMIT 20', dbcon)
            load(df, tbl[0])
    except Exception as e:
        print("Data extract error: " + str(e))



# load data to postgres
def load(df, tbl):
    try:
        rows_imported = 0
        engine = create_engine(f'postgresql://{Puid}:{pwd}@{server}:5432/bowlingleaguedb')
        print(f'importing rows {rows_imported} to {rows_imported + len(df)}... for table {tbl}')
        # save df to postgres
        df.to_sql(f'stg_{tbl}', engine, if_exists='replace', index=False)
        rows_imported += len(df)
        # add elapsed time to final print out
        print("Data imported successful")
    except Exception as e:
        print("Data load error: " + str(e))


try:
    # call extract function
    extract()
except Exception as e:
    print("Error while extracting data: " + str(e))
