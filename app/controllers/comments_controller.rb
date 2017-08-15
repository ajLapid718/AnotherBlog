class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to @post
    else
      # flash.now[:errors] = @comment.errors.full_messages || this shows the alert message like ["body can't be blank"]
      render :new # the new.html.erb has a partial that has more descriptive (though not aesthetic) errors
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment successfully deleted."
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
