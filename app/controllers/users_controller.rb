class UsersController < ApplicationController
  load_and_authorize_resource only: :show

  def show
  	@user = current_user
  	@topics = current_user.topics.paginate(page: params[:page])
  end

end
