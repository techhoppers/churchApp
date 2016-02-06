class AdminController < ApplicationController
  #before_action :authenticate_user!
  layout "admin"
  def index
    @pages = Page.all
  end

  def home
    @page = Page.find_by_title("dashboard")
  end

end
