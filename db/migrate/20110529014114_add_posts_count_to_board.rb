class AddPostsCountToBoard < ActiveRecord::Migration
  def self.up
    add_column :boards, :posts_count , :integer, :default => 0
  end

  def self.down
    remove_column :boards, :posts_count
  end
end
