class AddTdCategoryIdToTdListItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :td_list_items, :td_category, null: false, foreign_key: true
  end
end
