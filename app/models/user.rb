class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:line, :facebook]

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      email: auth.info.email,
      user_name: auth.info.name,
      password: Devise.friendly_token[0, 20],
      profile_image: auth.info.image
    )
    user
  end
end
