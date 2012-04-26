class Creation < ActiveRecord::Base
  attr_accessible :trail_id, :user_id
  belongs_to :user
  has_many :trails, :dependent => :destroy
  
end
