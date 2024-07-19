class GroupsController < ApplicationController
	before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.page(params[:page])
  end
end
