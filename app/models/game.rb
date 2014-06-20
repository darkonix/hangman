class Game < ActiveRecord::Base
  has_many :rounds

  before_create :set_token

  def set_token
    self.token = loop do
      self.token = SecureRandom.urlsafe_base64(5)
      break self.token unless Game.find_by_token(self.token)
    end
  end
end
