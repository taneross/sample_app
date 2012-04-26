class TrailsController < ApplicationController
  
  def new
    @title = "Make New Trail"
    @trail = Trail.new
  end
  
  def create
    @user = current_user
    @creation = @user.creations.create(params[:creation])
    @trail = Trail.new(params[:trail])
    @trail.user_id = current_user.id
    @trail.creation_id = @creation.id
     
     if @trail.save
       redirect_to @trail
     else
       flash.now[:error] = "Title and Description required"
       render 'new'
     end
  end
  
  def show
    @trail = Trail.find(params[:id])
    @title = @trail.title
  end
  
  def edit
    @trail = Trail.find(params[:id])
  end
  
  def update
     @trail = Trail.find(params[:id])
     @trail.update_attributes(params[:trail])
      redirect_to @trail
  end
 
end


