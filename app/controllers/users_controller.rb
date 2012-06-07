class UsersController < ApplicationController
  #before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  
  
  
  def new
    @user = User.new
    @title = "Sign Up"
    @user.typeof = "player"
  end
  
  def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  
  def edit
      @title = "Edit user"
  end
  
  def index
      @title = "All users"
      #@users = User.all
      @users = User.order(:name).page params[:page] #kaminari gem
  end

  def show
      @user = User.find(params[:id])
      @title = @user.name
      @microposts = @user.microposts.page params[:page] #kaminari gem
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
    end
    
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        redirect_to @user
      else
        @title = "Edit user"
        render 'edit'
      end
    end
    
    def following
        @title = "Following"
        @user = User.find(params[:id])
        @users = @user.followed_users.order(:name).page params[:page] #kaminari gem
        render 'show_follow'
      end

      def followers
        @title = "Followers"
        @user = User.find(params[:id])
        @users = @user.followers.order(:name).page params[:page] #kaminari gem
        render 'show_follow'
      end
      
 
    
    
    private

       # def authenticate   #removed because mircroposts needed it, now in sessions_helper
          #deny_access unless signed_in? #sessions_helper
        #end  
        
        def correct_user
              @user = User.find(params[:id])
              redirect_to(root_path) unless current_user?(@user)
        end
        def admin_user
             redirect_to(root_path) unless current_user.admin?
           end
end
