class WebsitesController < ApplicationController
  before_action :set_website, only: [:get_bookmarks]
  
  def index
    @websites = Website.all
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
