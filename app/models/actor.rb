class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, through: :roles
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
end
