class User < ApplicationRecord

  has_secure_password
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "No special characters allowed" }
  validates :first_name, :last_name, :email , :password, presence: true
end

