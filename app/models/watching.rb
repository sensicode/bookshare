class Watching < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  
  validates_presence_of :book, :user
  
  before_create :book_must_not_already_be_watched_by_this_user, :cant_watch_your_own_book, :book_must_be_available_or_on_loan
  
  protected
  
  def cant_watch_your_own_book
    user = User.find(@user)
    if user.books.include?(@book)
      false
    else
      true
    end
  end
  
  def book_must_not_already_be_watched_by_this_user
    if Watching.find_all_by_book_id_and_user_id(@book.id, @user.id).count > 0
      false
    else
      true
    end
  end
  
  def book_must_be_available_or_on_loan
    if @book.available? || @book.on_loan?
      true
    else
      false
    end
  end
  
end
