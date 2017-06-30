include: "mint_base.view.lkml"

explore: mint_block_andy {
  extension: required
  from: calendar
  view_name: calendar
  join: mint_data {
    from: mint_block_andy
    view_label: "Mint Data"
    type: left_outer
    sql_on: ${mint_data.date_raw}=${calendar.date_raw} ;;
    relationship: one_to_many
  }
}

view: mint_block_andy {
  extends: [mint_base_view]
  sql_table_name: personal_finance.mint_andy ;;

  dimension: category {
    type: string
    sql: case when (${amount_signed}=-4000 and ${category_raw}='Check')
              or (${transaction_type}='credit' and substr(${original_description},1,18)='BKOFAMERICA MOBILE')
              then 'Rent, Utilities and Roommates'
    else ${category_raw} end;;
  }

  }
