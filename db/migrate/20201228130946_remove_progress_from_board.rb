class RemoveProgressFromBoard < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :progress, :integer
  end
end
