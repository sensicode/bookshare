class MemberMessage < ActionMailer::Base
  
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
  
  def registration_confirmation(recipient)
    @recipient = recipient
    mail(
      :to => recipient.email,
      :from => "noreply@sutton.gov.uk",
      :subject => "Welcome to Sutton Bookshare"
    ) do |format|
      format.html
#       format.text
    end
  end
end
