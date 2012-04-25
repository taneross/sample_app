class TrailsController < ApplicationController
  
  def new
    @title = "Make New Trail"
    @trail = Trail.new
  end
  
  def create
     @trail = Trail.new(params[:trail])
     if @trail.save
       redirect_to @trail
     else
       @title = "You didn't create one"
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