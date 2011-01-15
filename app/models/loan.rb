class Loan < ActiveRecord::Base
  belongs_to  :book

  belongs_to  :lender,
              :class_name => "User",
              :foreign_key => :lender_id
              
  belongs_to  :borrower,
              :class_name => "User",
              :foreign_key => :borrower_id

  validates_presence_of :lender, :borrower, :book, :due

  validate :borrower_cant_be_lender
              
  def on_loan?
    self.returned.nil?
  end
  
  protected
    def borrower_cant_be_lender
      errors.add(:borrower, "you can't lend a book to yourself") if borrower == lender
    end
  
end
