class Movie < ApplicationRecord

has_many :bookmarks
validates :title, uniqueness: true
validates :title, :overview, presence: true

  def index
    @movies = Movies.all
  end

end
