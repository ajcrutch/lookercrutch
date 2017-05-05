connection: "personal_bq"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: mint_andy {
  from: mint_block_andy
  extends: [mint_base_explore]
  view_label: "Mint Data"
}
