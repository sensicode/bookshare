require 'digest/md5'

class User < ActiveRecord::Base
  has_many :books

  has_many :watchings
  has_many :watched_books, :through => :watchings, :source => :book
  
  has_many  :borrowings,
            :class_name => "Loan",
            :foreign_key => :borrower_id
            
  has_many  :loans,
            :class_name => "Loan",
            :foreign_key => :lender_id
            
  has_many  :active_borrowings,
            :class_name => "Loan",
            :foreign_key => :borrower_id,
            :conditions => { :returned => nil },
            :order => 'due'
            
  has_many  :active_loans,
            :class_name => "Loan",
            :foreign_key => :lender_id,
            :conditions => { :returned => nil },
            :order => 'due'
            
            
  validates_presence_of :first_name, :last_name, :address1, :city, :postcode
  
  acts_as_authentic
  
  def gravatar_image_url(size = 40)
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(self.email.strip.downcase) + "?d=identicon&s=" + size.to_s
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  def owns?(book)
    self.books.include?(book)
  end
  
  # Can this user watch this book?
  def watched?(book)
    # Not if they're already watching it
    self.watched_books.include?(book)
  end
end
