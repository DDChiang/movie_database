class Spoiler < ActiveRecord::Base
  has_one :movie
  belongs_to :user
  def slug
    @string = movie.name + " spoiler written by "+user.chosen_name
    @string.name.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end

end
