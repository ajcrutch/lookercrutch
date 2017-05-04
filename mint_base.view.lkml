explore: mint_base_explore {
  extension: required
}

view: mint_base_view {
  extension: required

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: amount {
    type: number
    value_format_name: usd
#     hidden: yes
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_tier {
    type:  tier
    sql: ${amount} ;;
    tiers: [0,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500]
  }

  dimension: is_expensive {
    type: yesno
    sql: ${amount}>1000 ;;
  }

  measure:count_expensive {
    type: count
    filters: {
      field: is_expensive
      value: "yes"
    }
  }

  measure: percent_expensive {
    value_format: "0.00%"
    type: number
    sql: 1.0*${count_expensive}/nullif(${count},0) ;;
  }


  measure: percent_high {}

  measure: total_amount {
    value_format_name:  usd
    type: sum
    sql: ${amount} ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: original_description {
    type: string
    sql: ${TABLE}.original_description ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  measure: count {
    type: count
#     approximate_threshold: 100000
    drill_fields: [account_name]
  }
}
