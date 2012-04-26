class Trail < ActiveRecord::Base
  attr_accessible :category, :description, :title, :twitter, :user_id, :creation_id
  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  
  belongs_to :creation, :dependent => :destroy #how do i destroy creation if trail is destroyed
  
end
