class MemberMessage < ActionMailer::Base
  default :from => "adrian.short@gmail.com"
  
  def member_message(sender, recipient, message)
    @message = message
    @sender = sender
    
    mail(
      :to => recipient.email,
      :from => sender.email,
      :subject => "Message from Sutton Bookshare member #{@sender.name}"
    ) do |format|
      format.html
#       format.text
    end
  end
end
