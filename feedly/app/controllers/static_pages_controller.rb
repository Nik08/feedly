class StaticPagesController < ApplicationController

  def home
  	if logged_in?
      @status  = current_user.statuses.build
      #status_id_list=current_user.statuses.map {|status| status.id}
      #@comment = Comment.includes(:status).where(status_id: status_id_list).index_by(&:id)
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 4)
    end
  end




  def search
  	if params[:q].nil?
      @users = []
    else
      @users = User.search params[:q]
    end
  end

end