# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_creator, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments.roots.latest
    @comment = current_user&.comments&.build
    @user_like = @post.likes.find_by(user: current_user)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('posts.create.success')
    else
      render :new, status: :unprocessable_entity, alert: I18n.t('posts.create.failure')
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('posts.update.success')
    else
      render :edit, status: :unprocessable_entity, alert: I18n.t('posts.update.failure')
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path, notice: I18n.t('posts.destroy.success')
  end

  private

  def set_creator
    set_post

    redirect_to root_path, alert: I18n.t('posts.only_creator') unless @post.creator == current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
