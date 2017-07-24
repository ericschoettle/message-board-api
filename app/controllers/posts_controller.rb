class PostsController < ApplicationController
  def index
    @posts = Post.all
    search_params(params).each do |key, value|
      binding.pry
      @posts = @posts.public_send(key, value) if value.present?
    end
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
  def search_params(params)
    params.slice(:author, :title, :content)
  end

  def post_params
    params.permit(:author, :title, :content)
  end
end
