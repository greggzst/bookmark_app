class WebsitesController < ApplicationController
  before_action :set_website, only: [:get_bookmarks]
  
  def index
    @websites = Website.paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_bookmarks
  end

  def destroy
  end

  private
   def set_website
     @website = Website.find(params[:id]) 
   end
end
