# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    authenticate_user!
    @post = Post.find(params[:post_id])
    @comments = @post.comments.roots.latest
    @comment = current_user.comments.build(post_comment_params)
    @comment.post = @post

    if @comment.save
      flash[:success] = t('.success')
      redirect_to @post
    else
      flash.now[:error] = @comment.errors.first.full_message
      render 'posts/show', status: :unprocessable_entity
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id, :post_id)
  end
end
