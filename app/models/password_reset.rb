class PasswordReset < ActiveRecord::Base
  belongs_to :customer

  before_validation :generate_token
  
  def generate_token
    self.token ||= SecureRandom.hex(16)
  end
end