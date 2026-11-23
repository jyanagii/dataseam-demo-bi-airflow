connection: "bq_analytics"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

explore: daily_sales {
  label: "Daily Sales"
}

explore: orders {
  label: "Orders"
}
