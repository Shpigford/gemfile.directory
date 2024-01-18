class User < ApplicationRecord
  has_many :gemfiles
  has_many :favorites, dependent: :destroy

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def self.from_omniauth(omniauth_params)
    provider = omniauth_params.provider
    uid = omniauth_params.uid

    user = User.find_or_initialize_by(provider: provider, uid: uid)
    user.email = omniauth_params.info.email
    user.name = omniauth_params.info.name
    user.image = omniauth_params.info.image
    user.github_username = omniauth_params.info.nickname
    user.x_username = omniauth_params.extra&.raw_info&.twitter_username
    user.save
    user
  end
  
  def favorite_gemfiles
    Gemfile.where(id: favorites.where(favoritable_type: 'Gemfile').pluck(:favoritable_id)).with_favorites
  end
end
