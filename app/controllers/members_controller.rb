class MembersController < ApplicationController
  def show
    @user = User.find_by_login(params[:login])
  end
end
