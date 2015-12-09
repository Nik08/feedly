class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.paginate(page: params[:page], :per_page => 4)
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      flash.now[:success]= "Welcome to Feedly!"
      redirect_to @user
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end
end
