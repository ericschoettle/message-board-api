class PostsController < ApplicationController
  def index
    name = params[:name]
    @posts = Post.search(name)
    # @posts = Post.all
    json_response(@posts)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def create
    @post = Post.create!(post_params)
    json_response(@post, :created)
  end

  def update
    @post = Post.find(params[:id])
    @post.update!(post_params)
    json_response(@post, :ok)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.permit(:author, :title, :content)
  end
end
