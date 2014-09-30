class StaticPagesController < ApplicationController
  def front
    @movies = Movie.take(5)
  end
end
