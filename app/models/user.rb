class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :click_events, dependent: :destroy
  has_many :payments
  has_one :site, dependent: :destroy
  has_one :collection, dependent: :destroy

  before_create { |user| user.credits = 100 }

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  # def password_required?
  #   false
  # end

  def self.from_google(u)
    create_with(
      first_name: u[:first_name],
      last_name: u[:last_name],
      uid: u[:uid],
      provider: 'google',
      password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email]
    )
  end

  def confirmation_required?
    provider != 'google'
  end
end
