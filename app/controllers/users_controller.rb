class UsersController < ApplicationController

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
