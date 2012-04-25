class Trail < ActiveRecord::Base
  attr_accessible :category, :description, :title, :twitter
  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :description, :presence => true, :length => { :maximum => 500 }
end
