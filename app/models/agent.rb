require 'bcrypt'

class Agent < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :code_name, :email, :github,
                  :password, :password_confirmation

  validates :code_name, presence: true, length: {in: 3..20}
  validates :email, presence: true, length: {minimum: 6}
  validates :github, presence: true, allow_blank: false
  validates :password, presence: true, length: {minimum: 6}, confirmation: true, on: :create
  validates :password_salt, presence: true, on: :save
  validates :password_hash, presence: true, on: :save

  before_save :encrypt_password

  def self.authenticate(code_name, password)
    agent = Agent.find_by_code_name(code_name)
    if agent && agent.password_hash == BCrypt::Engine.hash_secret(password, agent.password_salt)
      agent
    else
      nil
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
