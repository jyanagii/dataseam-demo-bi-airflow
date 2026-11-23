- dashboard: executive_sales
  title: Executive Sales
  elements:
    - title: Daily Revenue
      name: Daily Revenue
      model: retail
      explore: daily_sales
      type: looker_line
      fields: [daily_sales.order_date, daily_sales.total_revenue]
