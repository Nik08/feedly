class StatusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]


  def create
  	@status = current_user.statuses.build(status_params)
    if @status.save
      flash[:success] = "status created!"
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def destroy
  end

  private

    def status_params
      params.require(:status).permit(:content)
    end
end
