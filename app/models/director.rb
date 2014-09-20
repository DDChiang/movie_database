class Director < ActiveRecord::Base
  has_and_belongs_to_many :movies
  validate :unique_firstlast_and_birthday_or_stage_name

  def unique_firstlast_and_birthday_or_stage_name
    other = Director.where('first' => first, 'last' => last).select {|a| a.id != id}
    other_with_birthday = other.select {|a| a.birthday == birthday}
    other_with_stage_name = other.select { |a| a.stage_name == stage_name }
    if other_with_birthday.count > 0 || other_with_stage_name.count > 0
      errors.add(:director, ": Duplicate director found")
    end
  end

  def slug
    (first + " " + last).downcase.gsub(" ","-")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
end
