class Api::V1::UsersController < ApiController
  before_action :authenticate, only: [:destroy]

  def index
    # ActiveRecord solution
    # @users = User.includes(:posts)

    # Calling method from module
    @users = User.get_users_and_posts
  end

  def show
    @user = User.get_user(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user
      @user.destroy
    else
      render json: { user: "not found" }, status: :not_found
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def authenticate
      @user = User.find_by(token: request.headers['HTTP_AUTHORIZATION'])
    end
end
