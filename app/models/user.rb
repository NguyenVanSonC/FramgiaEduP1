class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.maxname}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maxemail},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.minlength_pw},
    allow_nil: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: Settings.minimum_age,
    less_than: Settings.maximum_age}
  VALID_PHONE_REGEX = /\d[0-9]\)*\z/
  validates :phone, presence: true, length: {maximum: Settings.maximum_phone,
     minimum: Settings.minimum_phone}, format: {with: VALID_PHONE_REGEX}, uniqueness: true
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

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
