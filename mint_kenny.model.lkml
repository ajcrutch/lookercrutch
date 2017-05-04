##change this to kenny's mint
connection: "personal_bq"

# include some the views
include: "mint_base.view"
include: "mint_block_kenny.view"

# include all the dashboards
include: "*.dashboard"

explore: mint_kenny {
  extends: [mint_block_kenny]
}
