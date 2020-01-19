class Api::V1::UsersController < ApiController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :find_user, only: [:show]
  before_action :authenticate, only: [:destroy]

  def index
    @users = User.order('created_at DESC')
  end

  def show
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

    def find_user
  	 	@user = User.find(params[:id])
    end

    def authenticate
      @user = User.find_by(token: request.headers['HTTP_AUTHORIZATION'])
    end
end
