class Api::V1::PostsController < ApiController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, only: [:create, :destroy, :update]
  before_action :find_post, only: [:update, :destroy]

  def index
    @posts = Post.order('created_at DESC').page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
        render json: @post, status: :created
    else
        render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    puts @post
    if @post.update(post_params)
      render json: @post, status: 200, location: [:api, @post]
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    if @post
      @post.destroy
    else
      render json: { post: "not found" }, status: :not_found
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(token: token)
      end
    end

    def find_post
  	 	@post = @user.posts.find_by(params[:id])
    end
end
