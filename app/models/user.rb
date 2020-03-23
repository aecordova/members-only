class User < ApplicationRecord

  before_create :add_remember_token

  has_secure_password

  def add_remember_token
    self.remember_token = digest(new_token)
  end
  
  # Generate a new url safe token
  def new_token
    SecureRandom.urlsafe_base64
  end
  
  # Hash token
  def digest (token)
    Digest::SHA1.hexdigest (token)
  end




end
