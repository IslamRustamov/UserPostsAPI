class User < ApplicationRecord
  before_create { self.token = generate_token }
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  private

    def generate_token
      SecureRandom.urlsafe_base64
    end
end
