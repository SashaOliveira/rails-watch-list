class BookmarksController < ApplicationController
  def index
    @movies = Movies.all
  end
end
