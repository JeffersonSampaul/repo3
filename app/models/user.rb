class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates :e, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password # This includes all password related validations like password can't be blank, password does not match password confirmation etc
  validates :password, length: { minimum: 6 }
end





# Password related References:
# http://stackoverflow.com/questions/17116696/password-cant-be-blank-displayed-twice
# https://bubblogging.wordpress.com/2014/01/09/ror-has_secure_password-1/
# http://www.millwoodonline.co.uk/blog/using-hassecurepassword-for-rails-authentication
