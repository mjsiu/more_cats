class User < ActiveRecord::Base
  require 'SecureRandom'
  require 'Bcrypt'
  attr_reader :password

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :reset_session_token!

  has_many :cats

  def reset_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)

    user = User.find_by_user_name(user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
