class HomeController < ApplicationController


  def index
    @page = Page.find_by_title("dashboard")
  end

  def upload_summernote_image
    name = params[:file].original_filename
    directory = "#{Rails.root}/public/images/summernote"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    render :text => "http://localhost:3000/images/summernote/#{name}"
  end

  
end
