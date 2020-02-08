class User < ApplicationRecord
  before_create { self.token = generate_token }
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  private

    def generate_token
      SecureRandom.urlsafe_base64
    end

    # This method returns users and their posts
    def self.get_users_and_posts
      ActiveRecord::Base.connection.execute("
        SELECT
          users.name, users.email, posts.title, posts.body
        FROM
          users
        INNER JOIN
          posts
        ON
          users.id = posts.user_id")
    end

    # This method returns a specific user.
    # Parameter "id" is the id of the user we want to get
    def self.get_user(id)
      ActiveRecord::Base.connection.execute("
        SELECT
          users.name, users.email
        FROM
          users
        WHERE
          users.id = '#{id}'")
    end
end
