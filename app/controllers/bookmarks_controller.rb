class BookmarksController < ApplicationController
  def index
  end

  def new
    @bookmark = Bookmark.new
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end
end
