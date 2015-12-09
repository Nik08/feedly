class StaticPagesController < ApplicationController

  def home
  	if logged_in?
      @status  = current_user.statuses.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 4)
    end
  end
end