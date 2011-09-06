class UsersController < ApplicationController
  before_filter :require_no_user, :only => [ :new, :create ]
  before_filter :require_user, :only => [ :edit, :update, :watched_books, :loans ]
  before_filter :require_admin, :only => [ :unban, :promote, :demote, :show ]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    @user.status = 'user'
    @user.banned = false

    if @user.save
      flash[:notice] = "Thanks for joining #{CONFIG[:sitename]}. Welcome!"
      redirect_back_or_default books_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

#   def edit
#     @user = @current_user
#   end
  
#   def update
#     @user = @current_user # makes our views "cleaner" and more consistent
#     if @user.update_attributes(params[:user])
#       flash[:notice] = "Account updated!"
#       redirect_to account_url
#     else
#       render :action => :edit
#     end
#   end
  
  def promote
    @user = User.find_by_login(params[:id])
    @user.promote
    flash[:notice] = "#{@user.login} promoted OK"
    redirect_to :back
  end
  
  def demote
    @user = User.find_by_login(params[:id])
    @user.demote
    flash[:notice] = "#{@user.login} demoted OK"
    redirect_to :back
  end
    
  def watched_books
    @watchings = Watching.find_all_by_user_id(current_user, :order => "created_at DESC")
  end
  
  def loans
    @loans = current_user.active_loans
  end
  
  def borrowings
    @loans = current_user.active_borrowings
  end
  
  def unban
    @user = User.find(params[:id])
    @user.unban(current_user)
    flash[:notice] = "#{@user.login} unbanned OK"
    redirect_to :back
  end
end