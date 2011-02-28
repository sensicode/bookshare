class Book < ActiveRecord::Base
  belongs_to :title
  belongs_to :user

  has_many :watchings, :dependent => :destroy
  has_many :watchers, :through => :watchings, :source => :user
  
  has_many :loans
  
  validates_associated :title

  def status_text
    statuses = [
      'available',
      'on loan',
      'deleted',
      'lost'
    ]
    
    statuses[self.status]
  end

  def available?
    self.status == 0
  end

  def on_loan?
    self.status == 1
  end

  def deleted?
    self.status == 2
  end
  
  def lost?
    self.status == 3
  end
  
end
