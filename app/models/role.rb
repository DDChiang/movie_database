class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
  def slug
    name.downcase.gsub(" ","-")
  end

  def to_param
    "#{id}-#{slug}"
  end
end
