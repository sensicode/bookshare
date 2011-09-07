class MemberMessage < ActionMailer::Base
  
  default :theme => CONFIG[:theme]

  def member_message(sender, recipient, message)
    @message = message
    @sender = sender
    
    mail(
      :to => recipient.email,
      :from => sender.email,
      :subject => "Message from #{CONFIG[:sitename]} member #{@sender.login}"
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
      :subject => "Book request for \"#{@book.title.title}\" from #{CONFIG[:sitename]} member #{@sender.login}"
    ) do |format|
      format.html
#       format.text
    end
  end

  # FIXME
  def registration_confirmation(recipient)
    @recipient = recipient
    mail(
      :to => recipient.email,
      :from => CONFIG[:noreply_email] || CONFIG[:email], 
      :subject => "Welcome to #{CONFIG[:sitename]}"
    ) do |format|
      format.html
#       format.text
    end
  end
  
  def password_reset_instructions(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)

    mail(
      :to => user.email,
      :from => "noreply@sutton.gov.uk",
      :subject => "#{CONFIG[:sitename]} password reset instructions"
    ) do |format|
      format.html
      format.text
    end
  end
end
