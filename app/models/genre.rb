class Genre < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :movies
  before_save { self.name = name.downcase.gsub("[^a-z ]","")}
  before_save { self.slug = name.gsub(" ", "-") }
  def to_param
    "#{slug}"
  end
end
