class MemberMessage < ActionMailer::Base
  default :from => "adrian.short@gmail.com"
#   default_url_options[:host] = "www.suttonbookshare.org.uk"
  
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
end
