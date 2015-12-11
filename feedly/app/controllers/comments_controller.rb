class CommentsController < ApplicationController
  before_action :logged_in_user, only: [ :create]

  
  #creates comment
  def create
    @status = Status.find(params[:status_id])
    @comment = Comment.create(comment_params)
    @user=User.find_by(id: @status.user_id)
    if @comment.save
      redirect_to @user
    else
      redirect_to @user
    end
  end

 
  private
    def comment_params
      comment_hash = params.require(:comment).permit(:body,:status_id,:user_id)
    end
end
