class User < ApplicationRecord

  has_secure_password

  validates :password, confirmation: true, length: { in: 6..20 }
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "No special characters allowed" }
  validates :first_name, :last_name, :email , :password, :password_confirmation, presence: true
  validates :email, format: { without: /\s/, message: "must contain no spaces" }, :uniqueness => {:case_sensitive => false} 

    def self.authenticate_with_credentials(emailInput, passwordInput)
      user = User.find_by_email(emailInput.strip.downcase)
      if user && user.authenticate(passwordInput)
        user
      else
        nil
      end
    end



end

