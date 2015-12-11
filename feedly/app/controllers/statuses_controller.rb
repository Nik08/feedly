class StatusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

 #creates status
  def create
  	@status = current_user.statuses.build(status_params)
    @status.upvotes=0
    @status.downvotes=0
    if @status.save
      flash[:success] = "status created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
# it is used for deleting the status
  def destroy
  	@status.destroy
    flash[:success] = "Status deleted"
    redirect_to root_url

  end
#this is used for creating votes on status
  def upvote
    @status = Status.find(params[:id])
    @status.upvotes=@status.upvotes+1
    @status.save
    redirect_to root_url
  end

  def downvote
    @status = Status.find(params[:id])
    @status.downvotes=@status.downvotes+1
    @status.save
    redirect_to root_url
  end




  private

    def correct_user
      @status = current_user.statuses.find_by(id: params[:id])
      redirect_to root_url if @status.nil?
    end

    def status_params
      params.require(:status).permit(:content, :picture)
    end
end
