class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]
  
  layout "admin", :except => [:show]
  before_filter :get_page , :only => [:show, :edit, :update, :destroy, :enable, :disable]


  def index
    @pages = Page.all.order(:title)
  end

  def show
    
  end

  def new
    @pages = Page.all
    @page = Page.new
  end

  def create
    params.permit!
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = "Page created successfully!"
      redirect_to pages_path
    else
      flash[:error] = "Page creation failed!"
      render :action => :new
    end
  end

  def edit
    
  end

  def update
    params.permit!
    if @page.update_attributes(params[:page])
      flash[:success] = "Page updated successfully!"
      redirect_to pages_path
    else
      flash[:error] = "Page updation failed"
      render :action => :edit
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = "Page removed successfully!"
      redirect_to pages_path
    else
      flash[:error] = "Page removal failed! Please try again"
      redirect_to pages_path
    end
  end

  def enable
    if @page.enable!
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  def disable
    if @page.disable!
      redirect_to pages_path
    else
      redirect_to pages_path
    end
  end

  private

  def get_page
    @page = Page.find(params[:id])
  end
end
