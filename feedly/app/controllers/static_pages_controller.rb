class StaticPagesController < ApplicationController

  def home
  	if logged_in?
      @status  = current_user.statuses.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 4)
    end
  end



 #search action used with elastic search
  def search
  	if params[:q].nil?
      @users = []
    else
      @users = User.search params[:q]
    end
  end

end