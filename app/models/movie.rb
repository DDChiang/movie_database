class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_and_belongs_to_many :genres
  has_one :spoiler
  has_and_belongs_to_many :directors
  has_many :roles
  has_many :actors, through: :roles
  validates :name, :presence => true
  validate :name_opening_day_unique

  def name_opening_day_unique
    others = Movie.where('name' => name, 'opening_day' => opening_day).count
    if others > 1
      errors.add(:movie, ": Found duplicate movie listing.")
    end
  end  
  def slug
    name.downcase.gsub(" ", "-")
  end
  def to_param
    "#{id}-#{slug}"
  end
end
