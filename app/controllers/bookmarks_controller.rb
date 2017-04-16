class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  def index
    redirect_to root_url
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        create_tags
        flash[:success] = 'Bookmark was successfully created.'
        format.html { redirect_to root_url }
      else
        format.html { render :new }
      end
    end

  end

  def destroy
    @bookmark.destroy

    respond_to do |format|
      format.js
      format.html
    end
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:url,:user_tags)
    end

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def create_tags
      params[:bookmark][:user_tags].split(/,\s|\s|,/).each do |tag_name|
        if tag = Tag.where(name: tag_name).first
          @bookmark.tags << tag
        else
          tag = Tag.create(name: tag_name)
          @bookmark.tags << tag
        end
      end
    end
end
