class CreateTdCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :td_categories do |t|
      t.string :name
      t.string :description
      t.string :updated_by

      t.timestamps
    end
  end
end
