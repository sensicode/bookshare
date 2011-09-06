class AdminController < ApplicationController

  before_filter :require_admin

  def index
  end

  def stats
    @users = User.count
    @books = Title.count
    @loans = Loan.count
    @current_loans = Loan.find_all_by_returned(nil).count
    @watchings = Watching.count
  end
  
  def users
    @admins = User.admins
    @non_admins = User.non_admins
    @banned = User.banned
  end

end
