class Ban < ActiveRecord::Base
  
  belongs_to  :user
  
  # Admin user doing the banning
  belongs_to  :banner,
              :class_name => "User",
              :foreign_key => :banner
              
  # Admin user doing the unbanning
  belongs_to  :unbanner,
              :class_name => "User",
              :foreign_key => :unbanner
  
  attr_accessible :user_id, :banner, :unbanner, :reason
  
  validates_presence_of :user, :banner, :reason
  
  before_create :banner_must_be_admin,
                :banner_must_not_be_banee,
                :banee_must_not_already_be_banned,
                :banee_must_not_be_admin
  
  after_create :set_user_as_banned
  
  protected
  
  def set_user_as_banned
    @user = self.user
    @user.banned = true
    @user.save
  end
  
  def banner_must_be_admin
    @banner.admin?
  end
  
  # You can't ban yourself
  def banner_must_not_be_banee
    @banner != @user
  end
  
  def banee_must_not_already_be_banned
    !@user.banned?
  end
  
  def banee_must_not_be_admin
    !@user.admin?
  end
  
end
