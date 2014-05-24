class UsersController < ApplicationController

  def show
  	@user = current_user
  	@topics = current_user.topics.paginate(page: params[:page])
  end

end
