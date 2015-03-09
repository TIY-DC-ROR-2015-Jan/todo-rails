class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user, index: true
      t.string :title

      t.timestamps null: false
    end
    add_foreign_key :lists, :users
  end
end
