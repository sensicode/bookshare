class MemberMessage < ActionMailer::Base
  default :from => "adrian.short@gmail.com"
  
  def member_message(sender, recipient, message)
    @message = message
    @sender = sender
    
    mail(
      :to => recipient.email,
      :from => sender.email,
      :subject => "Message from Sutton Bookshare member #{@sender.login}"
    ) do |format|
      format.html
#       format.text
    end
  end
  
  def book_request(sender, recipient, book, message)
    @message = message
    @sender = sender
    @book = book
    
    mail(
      :to => recipient.email,
      :from => sender.email,
      :subject => "Book request for \"#{@book.title.title}\" from Sutton Bookshare member #{@sender.login}"
    ) do |format|
      format.html
#       format.text
    end
  end
  
end
