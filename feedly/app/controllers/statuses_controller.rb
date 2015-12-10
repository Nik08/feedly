class StatusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def create
  	@status = current_user.statuses.build(status_params)
    @status.votes=0
    if @status.save
      flash[:success] = "status created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@status.destroy
    flash[:success] = "Status deleted"
    redirect_to root_url

  end

  def upvote
    @status = Status.find(params[:id])
    @status.votes=@status.votes+1
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
