require 'digest'
class User < ActiveRecord::Base
  paginates_per 20 #kaminari gem
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :typeof
  
  has_many :microposts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed #Naturally, Rails allows us to override the default, in this case using the :source parameter (Listing 11.10), which explicitly tells Rails that the source of the followed_users array is the set of followed ids.
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  has_many :trails, :dependent => :destroy


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                    
  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence     => true,
                      :confirmation => true,
                      :length       => { :within => 6..40 } 
                 

  before_save :encrypt_password
  
  
  
  def following?(other_user)
      relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
      relationships.create!(:followed_id => other_user.id)
  end
  
  def unfollow!(other_user)
      relationships.find_by_followed_id(other_user.id).destroy
  end
  
  
  def feed
      # This is preliminary. See "Following users" for the full implementation.
      Micropost.where("user_id = ?", id)
    end

  def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
    end
    
    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
      end

      def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        return nil  if user.nil?
        return user if user.salt == cookie_salt
          #same as above
          #user = find_by_id(id)
          #(user && user.salt == cookie_salt) ? user : nil
      end
      
      
      
    private

      def encrypt_password
        self.salt = make_salt unless has_password?(password)
        self.encrypted_password = encrypt(password)
      end

      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end

      def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
      end

      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end
  end
 