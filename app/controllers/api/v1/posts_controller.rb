class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')

    render json: @posts
  end
end
