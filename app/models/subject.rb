class Subject < ActiveRecord::Base
  has_and_belongs_to_many :titles
  
  validates_length_of :name, :in => 2..255, :too_long => 'pick a shorter name', :too_short => 'pick a longer name'
end
