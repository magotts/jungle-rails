class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  before_save { self.email.downcase! }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip # converts to lower case and strips off the spaces in between
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end

end
