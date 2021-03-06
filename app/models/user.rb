class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true


  def full_name
    self.first_name.capitalize + ' ' + self.last_name.capitalize
  end
end
