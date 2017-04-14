class BookmarksController < ApplicationController
  def index
  end

  def new
    @bookmark = Bookmark.new
  end
end
