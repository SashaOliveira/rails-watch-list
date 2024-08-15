class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    @bookmark.save
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
