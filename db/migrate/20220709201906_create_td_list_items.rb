class CreateTdListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :td_list_items do |t|
      t.string :name
      t.string :description
      t.datetime :due_date
      t.integer :priority
      t.string :updated_by

      t.timestamps
    end
  end
end
