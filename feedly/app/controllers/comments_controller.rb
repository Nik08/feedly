class CommentsController < ApplicationController
  before_action :logged_in_user, only: [ :show,:create, :destroy]

  def show
  	@status = Status.find(params[:status_id])
  	@comment=@status.comments.paginate(page: params[:page], :per_page => 4)
  end

  def create
    @status = Status.find(params[:status_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      redirect_to comment
    else
      redirect_to 'comments/show'
    end
  end

  def destroy
  	@comment.destroy
    redirect_to root_url

  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
