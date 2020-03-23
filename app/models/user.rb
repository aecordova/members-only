class User < ApplicationRecord

  before_create :add_remember_token

  has_secure_password

  def add_remember_token
    self.remember_token = User.new_token
  end
  
  # Generate a new url safe token
  def self.new_token
    Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end
  

end
