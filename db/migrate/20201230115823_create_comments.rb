class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :board, null: false, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
