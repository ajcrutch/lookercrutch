include: "mint_base.view.lkml"

explore: mint_block_kenny {
  extends: [mint_base_explore]
  from: mint_block_kenny
}

view: mint_block_kenny {
  extends: [mint_base_view]
 ##CHANGE TO ACTUAL SQL TABLE NAME##
  sql_table_name: personal_finance.mint_kenny ;;

}
