class AddProgressToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :progress, :string
  end
end
