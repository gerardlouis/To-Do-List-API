class AddTdListIdToTdCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :td_categories, :td_list, null: false, foreign_key: true
  end
end
