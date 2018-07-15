class User < ApplicationRecord
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.maxname}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maxemail},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.minlength_pw},
    allow_nil: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 0,
    less_than: 150}
  VALID_PHONE_REGEX = /\d[0-9]\)*\z/
  validates :phone, presence: true, length: {maximum: 15, minimum: 10},
    format: {with: VALID_PHONE_REGEX}, uniqueness: true
  validates :birthday, presence: true

  class <<self
    def digest string
      cost = nil
      if ActiveModel::SecurePassword.min_cost
        cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
