class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        create_tags
        format.html { redirect_to root_url, notice: 'Bookmark was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:url)
    end

    def create_tags
      params[:user_tags].split(/,\s|\s|,/).each do |tag_name|
        if tag = Tag.where(name: tag_name).first
          @bookmark.tags << tag
        else
          tag = Tag.create(name: tag_name)
          @bookmark.tags << tag
        end
      end
    end
end
