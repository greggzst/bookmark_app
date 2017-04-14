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

    def create_tags
      params[:tags].split(/\s|,/).each do |tag_name|
        if tag = Tag.where(name: tag_name).first
          @bookmark.tags << tag
        else
          tag = Tag.create(name: tag_name)
          @bookmark.tags << tag
        end
      end
    end
end
