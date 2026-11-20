# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
require "open-uri"


puts "Cleaning database..."
Bookmark.destroy_all   # d'abord les bookmarks...
List.destroy_all
Movie.destroy_all      # ...sinon la foreign key bloque la suppression des films

puts "Creating movies..."

page = 0

10.times do
  page += 1
  url = "https://tmdb.lewagon.com/movie/top_rated?page=#{page}"
  response = URI.parse(url).read
  data = JSON.parse(response)
  index = -1
  20.times do
    index += 1
    Movie.create!(
      title: data["results"][index]["title"],
      overview: data["results"][index]["overview"],
      poster_url: "https://image.tmdb.org/t/p/w500#{data["results"][index]["poster_path"]}",
      rating: data["results"][index]["vote_average"]
    )
  end
end


puts "Created #{Movie.count} movies!"
