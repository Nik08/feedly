class StatusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy




  def create
  	@status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "status created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	@status.destroy
    flash[:success] = "Status deleted"
    redirect_to current_user

  end


  private

    def correct_user
      @status = current_user.statuses.find_by(id: params[:id])
      redirect_to root_url if @status.nil?
    end

    def status_params
      params.require(:status).permit(:content)
    end
end
