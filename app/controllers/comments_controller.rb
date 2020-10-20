class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params).includes([:user])
    @comment.tweet_id = params[:tweet_id]

    if @comment.save
      redirect_to root_path, notice: 'Comment was successfully created.'
    else
      redirect_to root_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
