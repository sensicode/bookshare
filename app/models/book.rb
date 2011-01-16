class Book < ActiveRecord::Base
  belongs_to :title
  belongs_to :user

  has_many :watchings  
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
end
