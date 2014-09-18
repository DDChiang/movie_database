class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  def slug
    @string = movie.name + " reviewed by "+user.chosen_name
    @string.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end

end
