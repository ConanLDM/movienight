class User < ApplicationRecord
    enum role: {
        3    basic: 0,
        4    admin: 1
        5  }
        6  has_and_belongs_to_many :movies
        7
        8  # Include default devise modules. Others available are:
        9  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
        10  devise :database_authenticatable, :registerable,
        11         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
        12
        13  def self.from_omniauth(auth)
        14    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        15      user.email = auth.info.email
        16      user.password = Devise.friendly_token[0, 20]
        17      # user.name = auth.info.name   # assuming the user model has a name
        18      # user.image = auth.info.image # assuming the user model has an image
        19      # If you are using confirmable and the provider(s) you use validate emails,
        20      # uncomment the line below to skip the confirmation emails.
        21      # user.skip_confirmation!
        22    end
        23  end
  end