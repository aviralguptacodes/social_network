class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@like = @post.likes.build(user: current_user)
		if @like.save
			redirect_to post_path(@post), notice: 'Post liked.'
		else
			redirect_to post_path(@post), alert: 'Unable to like post.'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@like = @post.likes.find_by(user: current_user)
		@like.destroy if @like
		redirect_to post_path(@post), notice: 'Post unliked.'
	end
end
  