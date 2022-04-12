class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    parsedEmail = email.strip.downcase
    user = User.find_by_email(parsedEmail)
    if (user && user.authenticate(password))
      user
    else
      nil
    end
  end

  def authentication(email, password)
    self.class.authenticate_with_credentials(email, password)
  end
end
