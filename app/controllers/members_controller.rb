class MembersController < ApplicationController
  def index
    @members = User.all :order => 'RANDOM()', :limit => 30
  end

  def show
    @user = User.find_by_login(params[:login])
    @very_overdue_count = 0
  end
end
