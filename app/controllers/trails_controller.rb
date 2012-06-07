class TrailsController < ApplicationController
  
  def new
    @title = "Make New Trail"
    @trail = Trail.new
    @trail.status = false
  end
  
  def create
    @user = current_user
    @trail = Trail.new(params[:trail])
    @trail.user_id = @user.id
     logger.debug "TRAIL!!!!!!!!!!!!create: am i in a trial? #{@trail.to_yaml}"
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
    logger.debug "TRAIL!!!!!!!!!!!!show: am i in a trial? #{@trail.to_yaml}"
  end
  
  def destroy
      @trail = Trail.find(params[:id])
        logger.debug "!!!!!!!!!!!!destroy: am i in a trial? #{@trail.to_yaml}"
      @trail.destroy
      flash[:success] = "Trail destroyed."
      redirect_to current_user
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


