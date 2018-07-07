class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.integer :position, null: false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
