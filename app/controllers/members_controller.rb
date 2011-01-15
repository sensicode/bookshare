class MembersController < ApplicationController
  def show
    @user = User.find_by_login(params[:login])
    @very_overdue_count = 0
  end
end
