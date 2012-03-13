class AddPostsCountToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :posts_count , :integer, :default => 0
  end
end
