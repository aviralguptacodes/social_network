class PostsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @group = Group.find(params[:group_id])
      @post = @group.posts.build(post_params)
      @post.user = current_user
      if @post.save
        redirect_to group_path(@group), notice: 'Post was successfully created.'
      else
        redirect_to group_path(@group), alert: 'Failed to create post.'
      end
    end
  
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments.page(params[:page])
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content)
    end
  end
  