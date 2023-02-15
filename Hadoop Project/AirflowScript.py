import airflow
from airflow.models import DAG
from airflow.utils.dates import days_ago
from airflow.operators.bash_operator import BashOperator
from airflow.operators.hive_operator import HiveOperator
from airflow.contrib.operators.spark_submit_operator import SparkSubmitOperator
from airflow.operators.dummy_operator import DummyOperator

DAG_NAME = 'test_project_airflow_9'
args = {
    'owner': 'Airflow',
    'start_date': airflow.utils.dates.days_ago(1),
}

dag_prjt_main = DAG(
    dag_id=DAG_NAME,
    default_args=args,
    schedule_interval='* * * * *' #"@once"
)

SQOOP_Task1 = BashOperator(task_id="Sqoop_Incremental",
                      bash_command='sqoop job --exec testweblog_ws1', dag=dag_prjt_main)

my_query = """
    USE {{ params.db }};
    set hive.exec.dynamic.partition=true;
    set hive.exec.dynamic.partition.mode=nonstrict;          
    set hive.exec.max.dynamic.partitions=1000;
    insert into weblog_Dynamicpart_sqoop_internal partition(host) select id, datevalue, ipaddress, url, responsecode, host from weblog_external as b where not exists (select a.id from weblog_Dynamicpart_sqoop_internal as a where a.id = b.id);
    """

hive_Task2 = HiveOperator(
    task_id= "Hive_Seeding",
    hive_cli_conn_id='hive_local',
    hql = my_query,
    params={'db': 'test'},
    dag=dag_prjt_main)

spark_submit_Task3 = SparkSubmitOperator(
    task_id="sparksubmit_Aggregate",
    application='/home/PycharmProjects/Airflow_Demo/test/testspark_hiveagg.py',
    conn_id='spark_local', dag= dag_prjt_main)


SQOOP_Task1 >> hive_Task2 >> spark_submit_Task3

if __name__ == '__main__':
    dag_prjt_main.cli()