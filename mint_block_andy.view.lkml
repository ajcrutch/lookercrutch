include: "mint_base.view.lkml"

explore: mint_block_andy {
  extends: [mint_base_explore]
  from: mint_block_andy
}

view: mint_block_andy {
  extends: [mint_base_view]
  sql_table_name: personal_finance.mint_andy ;;

  }
