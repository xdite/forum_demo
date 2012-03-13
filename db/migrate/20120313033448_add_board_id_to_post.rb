class AddBoardIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :board_id, :integer
  end
end
