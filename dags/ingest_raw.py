"""Load raw orders and customers into BigQuery."""

from datetime import datetime

from airflow import DAG
from airflow.providers.google.cloud.operators.bigquery import BigQueryInsertJobOperator

with DAG(
    dag_id="ingest_raw_daily",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:
    load_orders = BigQueryInsertJobOperator(
        task_id="load_raw_orders",
        configuration={
            "load": {
                "sourceUris": ["gs://acme-landing/orders/*.parquet"],
                "destinationTable": {
                    "projectId": "acme-analytics-prod",
                    "datasetId": "raw",
                    "tableId": "orders",
                },
            }
        },
    )
    load_customers = BigQueryInsertJobOperator(
        task_id="load_raw_customers",
        configuration={
            "load": {
                "sourceUris": ["gs://acme-landing/customers/*.parquet"],
                "destinationTable": {
                    "projectId": "acme-analytics-prod",
                    "datasetId": "raw",
                    "tableId": "customers",
                },
            }
        },
    )
