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
puts "Cleaning database..."
Bookmark.destroy_all   # d'abord les bookmarks...
List.destroy_all
Movie.destroy_all      # ...sinon la foreign key bloque la suppression des films

puts "Creating movies..."
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
movies = [
  { title: "Inception", overview: "A thief who steals secrets through dreams is asked to plant an idea in a target's mind.", rating: 8.4 },
  { title: "The Godfather", overview: "The aging head of a crime family hands control of his empire to his reluctant son.", rating: 8.7 },
  { title: "Pulp Fiction", overview: "Several stories of Los Angeles criminals collide in unexpected ways.", rating: 8.5 },
  { title: "The Dark Knight", overview: "Batman faces the Joker, a criminal who wants to plunge Gotham into chaos.", rating: 8.5 },
  { title: "Forrest Gump", overview: "A kind man with a simple outlook finds himself at the heart of major moments of American history.", rating: 8.5 },
  { title: "Fight Club", overview: "An insomniac office worker and a soap salesman start an underground fighting club.", rating: 8.4 },
  { title: "Interstellar", overview: "A team of astronauts travels through a wormhole to find a new home for humanity.", rating: 8.4 },
  { title: "Spirited Away", overview: "A young girl trapped in a world of spirits must work in a bathhouse to free her parents.", rating: 8.5 },
  { title: "Parasite", overview: "A poor family cunningly gets hired, one by one, by a wealthy household.", rating: 8.5 },
  { title: "The Matrix", overview: "A hacker discovers that the world he lives in is a simulation controlled by machines.", rating: 8.2 },
  { title: "Gladiator", overview: "A betrayed Roman general becomes a gladiator to take revenge on the emperor.", rating: 8.2 },
  { title: "Amélie", overview: "A shy waitress in Paris decides to secretly change the lives of the people around her.", rating: 7.9 },
  { title: "The Lion King", overview: "A young lion prince flees his kingdom after his father's death and must return to claim it.", rating: 8.3 },
  { title: "Back to the Future", overview: "A teenager is accidentally sent thirty years into the past in a time-travelling car.", rating: 8.3 },
  { title: "Whiplash", overview: "A young drummer is pushed to his limits by a ruthless music teacher.", rating: 8.4 },
  { title: "Coco", overview: "A boy who dreams of becoming a musician finds himself in the Land of the Dead.", rating: 8.2 }
]

movies.each do |movie|
  Movie.create!(
    title: movie[:title],
    overview: movie[:overview],
    rating: movie[:rating],
    poster_url: "https://placehold.co/500x750?text=#{movie[:title].gsub(' ', '+')}"
  )
end
puts "Created #{Movie.count} movies!"
