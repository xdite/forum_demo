class Post < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  belongs_to :user
end
