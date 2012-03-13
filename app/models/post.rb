class Post < ActiveRecord::Base
  belongs_to :board, :counter_cache => true
  belongs_to :user
  
  has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
end
