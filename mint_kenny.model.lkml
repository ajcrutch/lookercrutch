connection: "personal_bq"

# include some the views
include: "mint_base.view"
include: "mint_block_kenny.view"

# include all the dashboards
include: "*.dashboard"

explore: mint_kenny {
  from: mint_block_kenny
  extends: [mint_base_explore]
  view_label: "Mint Data"
}
