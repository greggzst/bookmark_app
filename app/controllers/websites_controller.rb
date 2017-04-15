class WebsitesController < ApplicationController
  def index
    @websites = Website.all
  end

  def destroy
  end
end
