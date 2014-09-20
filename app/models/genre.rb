class Genre < ActiveRecord::Base
  before_validation :downcase_name
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :movies
  before_save { self.slug = name.gsub(" ", "-") }
  def downcase_name
    self.name = self.name.downcase
  end
  def to_param
    "#{slug}"
  end
end
