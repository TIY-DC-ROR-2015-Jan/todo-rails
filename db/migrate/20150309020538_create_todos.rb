class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.belongs_to :list, index: true
      t.string :description
      t.date :due_on
      t.boolean :complete

      t.timestamps null: false
    end
    add_foreign_key :todos, :lists
  end
end
