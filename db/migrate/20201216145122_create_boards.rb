class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :title
      t.string :responsible
      t.text :body
      t.string :deadline

      t.timestamps
    end
  end
end
