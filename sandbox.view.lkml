explore: sandbox {}
view: sandbox {
  sql_table_name: dumbdumb ;;

dimension: sku_type {
  type: string
  sql: ${TABLE}.sku_type ;;
}

dimension: activation_main_mrr_all {}
dimension: activation_main_mrr_to_date {}
dimension_group: activation {
  type: time
  }

dimension_group: not_nw_activation {
  type: time
  sql: case when ${sku_type}="SKU Not NW" then ${activation_raw} else null end;;
}

dimension_group: is_nw_activation {
  type: time
  sql: case when ${sku_type}<>"SKU Not NW" then ${activation_raw} else null end;;
  }

  measure: min_not_nw_activation_date {
    type: min
    sql: ${not_nw_activation_date} ;;
  }

  measure: min_is_nw_activation_date {
    type: min
    sql: ${is_nw_activation_date} ;;
  }

dimension: mrr_not_zero {
  type: yesno
  sql: ${activation_main_mrr_all}<>0 ;;
}

dimension: mrr_to_date_high {
  type:  yesno
  sql: ${activation_main_mrr_to_date}/${activation_main_mrr_all})>=0.75 ;;
}

  measure: not_nw_main_activation {
#     hidden: yes
    type: min
    sql: ${activation_date} ;;
    #convert_tz: no
      filters: {
        field: sku_type
        value: "SKU Not NW"
        field: mrr_not_zero
        value: "yes"
        field: mrr_to_date_high
        value: "yes"
      }
#       drill_fields: [location.name, sku_type, sku, tpn_service_attributes.activation_date, count_services, sum_activated_mrr]
    }

dimension: user_id {
  type: number
  sql: ${TABLE}.user_id ;;
}

    measure: count_users {
      type: count_distinct
      sql: ${user_id} ;;
    }

dimension:  head_type {
  type:  string
  sql: ${TABLE}.head_type ;;
}

    dimension: is_big_head {
      type: yesno
      sql: ${head_type}="Big" ;;
    }

    measure:count_only_big_heads {
      type: count_distinct
      sql:  ${user_id};;
      filters: {
        field: is_big_head
        value: "yes"
      }
    }

    measure: percentage_big_headed {
      type: number
      sql: 1.0*${count_only_big_heads}/nullif(${count_users},0) ;;
    }

#     measure: main_activation {
#
#       type: date
#       sql:
#         Min(
#         CASE WHEN (${sku} LIKE '%NW%') THEN ${tpn_service_attributes.activation_date} WHEN ${activation_main.mrr_all}=0 THEN NULL WHEN (${activation_main.mrr_to_date}/${activation_main.mrr_all})>=0.75 Then ${tpn_service_attributes.activation_date} Else Null END
#         )  ;;
#       convert_tz: no
#       #drill_fields: [detail*]
#       drill_fields: [location.name, sku, tpn_service_attributes.activation_date, count_services, sum_activated_mrr]
#   }
}
