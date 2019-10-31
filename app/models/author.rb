class Author < ApplicationRecord

  has_secure_password
  has_secure_token :confirmation_token
  validates :username, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  def to_session
    {id: id}
  end

end
