# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.load(URI.open(url))

Movie.destroy_all

movies["results"].each do |movie|
  Movie.create({title: movie["title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: '%.1f' % movie['vote_average'] })
end
