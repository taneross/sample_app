class Micropost < ActiveRecord::Base
  attr_accessible :content #, :user_id  ...don't wanna make accessible via browser
  
  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
    
  default_scope :order => 'microposts.created_at DESC'
  
  paginates_per 10 #kaminari gem  TR add
end
