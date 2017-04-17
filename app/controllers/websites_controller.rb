class WebsitesController < ApplicationController
  before_action :set_website, only: [:get_bookmarks, :destroy]
  
  def index
    @websites = Website.paginate(page: params[:page], per_page: 35)
    if params[:search]
      @results = Website.search(params[:search])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_bookmarks
  end

  def destroy
    @website.destroy
    respond_to do |format|
      format.js
      format.html
    end
  end

  private
   def set_website
     @website = Website.find(params[:id]) 
   end
end
