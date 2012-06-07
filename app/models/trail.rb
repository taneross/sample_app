class Trail < ActiveRecord::Base
  attr_accessible :category, :description, :title, :twitter, :user_id, :status, :cover, :startDate, :startTime, :endDate, :endTime, :recurring, :active_id #recuring=true means live=true
  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates_presence_of :startDate, :if => :live?
  
  belongs_to :user
  has_many :chapters, :dependent => :destroy
    
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  
  def live?
    recurring #if the date isn't proper format, the error says 'requires title and desc'
  end

  
end
