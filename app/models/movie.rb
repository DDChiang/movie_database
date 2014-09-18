class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_and_belongs_to_many :genres
  has_many :spoilers
  has_and_belongs_to_many :directors
  has_many :roles
  has_many :actors, through: :roles
  def slug
    name.downcase.gsub(" ", "-")
  end
  def to_param
    "#{id}-#{slug}"
  end
end
