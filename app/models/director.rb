class Director < ActiveRecord::Base
  has_and_belongs_to_many :movies
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
end
