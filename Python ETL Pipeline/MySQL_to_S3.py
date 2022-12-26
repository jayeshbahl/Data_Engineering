import pandas as pd
import json
import io
import boto3
import os
import pymysql

# Get API Keys
content = open('config.json')
config = json.load(content)
access_key = config['access_key']
secret_access_key = config['secret_access_key']

def extract():
    try:
        dbcon = pymysql.connect(host="localhost", user="root", password="Hellojay@69", database="airbnb")
        tables = pd.read_sql_query("""show tables""",dbcon, parse_dates=True)
        table_list = tables.values.tolist()
        for tbl in table_list:
            # query and load save data to dataframe
            df = pd.read_sql_query(f'select * FROM {tbl[0]}', dbcon)
            load(df, tbl[0])
    except Exception as e:
        print("Data extract error: " + str(e))



# load data to S3
def load(df, tbl):
    try:
        rows_imported = 0
        print(f'importing rows {rows_imported} to {rows_imported + len(df)}... for table {tbl}')
        # save to s3
        upload_file_bucket = 'msql-to-s3'
        upload_file_key = 'public/' + str(tbl) + f"/{str(tbl)}"
        filepath =  upload_file_key + ".csv"
        #
        s3_client = boto3.client('s3', aws_access_key_id=access_key, aws_secret_access_key=secret_access_key,region_name='us-east-1')
        with io.StringIO() as csv_buffer:
            df.to_csv(csv_buffer, index=False)

            response = s3_client.put_object(
                Bucket=upload_file_bucket, Key=filepath, Body=csv_buffer.getvalue()
            )

            status = response.get("ResponseMetadata", {}).get("HTTPStatusCode")

            if status == 200:
                print(f"Successful S3 put_object response. Status - {status}")
            else:
                print(f"Unsuccessful S3 put_object response. Status - {status}")
            rows_imported += len(df)
            print("Data imported successful")
    except Exception as e:
        print("Data load error: " + str(e))


try:
    # call extract function
    extract()
except Exception as e:
    print("Error while extracting data: " + str(e))
