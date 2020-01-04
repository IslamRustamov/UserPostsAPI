class User < ApplicationRecord
  before_create: { self.token = generate_token }
  has_many :posts, dependent: :destroy

  validates :name, presence: true

  private

    def generate_token
      loop do
        token = SecureRandom.hex
        token unless User.exists?({ token: token })
      end
    end
end
