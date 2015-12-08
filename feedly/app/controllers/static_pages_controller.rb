class StaticPagesController < ApplicationController

  def home
    @status = current_user.statuses.build if logged_in?
  end
end