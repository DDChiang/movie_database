class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :chosen_name, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :movies #authored posts
  has_many :ratings  
  def chosen_name_unique
    if chosen_name != nil
       if (User.where('chosen_name' => chosen_name).count > 2)
         errors.add(:chosen_name, "Please choose a different user name")
       end
    end
  end

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name.gsub(/\s+$/,'')
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name.gsub(/\s+$/,'')
        user.email = auth.info.email
      end
    end
  end

end
