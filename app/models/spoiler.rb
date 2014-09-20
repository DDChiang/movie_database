class Spoiler < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  validate :unique_user_movie
  def unique_user_movie
    others = Spoiler.where('movie_id' => movie_id).select { |s| s.id != id}
    if others.count > 0
      errors.add( :spoiler, ": A spoiler has already been submitted for this movie. Please edit that one instead")
    end
  end
  def slug
    @string = movie.name + " spoiler written by " #+ user.chosen_name
    @string.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end

end
