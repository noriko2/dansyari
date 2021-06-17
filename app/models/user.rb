class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
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

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      params.delete(:current_password)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end
