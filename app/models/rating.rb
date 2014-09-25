class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  validate :unique_user_movie
  def unique_user_movie
    #just a precaution, so that users using http clients cannot spam. The ratings#new path has been removed.
    other_rating = Rating.where('user_id' => user_id, 'movie_id' => movie_id).select {|r| r.id != id}
    if other_rating.count > 0
      errors.add(:user, ": You have already reviewed this movie")
     end
  end
  def slug
    @string = movie.name + " reviewed by "+user.chosen_name
    @string.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end

  def is_admin_or_same_user(user)
    user.id == user_id
  end
end
