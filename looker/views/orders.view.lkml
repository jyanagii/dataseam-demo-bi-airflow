view: orders {
  sql_table_name: `acme-analytics-prod.core.orders` ;;

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  measure: gross_amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }
}
