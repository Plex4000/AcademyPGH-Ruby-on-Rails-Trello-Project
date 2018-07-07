class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :position
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
