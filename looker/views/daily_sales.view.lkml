view: daily_sales {
  sql_table_name: `acme-analytics-prod.mart.daily_sales` ;;

  dimension: order_date {
    type: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.total_amount ;;
  }
}
