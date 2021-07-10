class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true
  validates :name, uniqueness: true


  def get_movie_image
    poster_path = @movies.poster_path
    response = HTTP.get("https://image.tmdb.org/t/p/w500/#{poster_path}")
    parsed_response = JSON.parse(response)
    parsed_response["Image"]
  end
end
