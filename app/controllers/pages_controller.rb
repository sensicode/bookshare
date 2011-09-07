class PagesController < ApplicationController
  def home
    @books = Book.all :order => 'RANDOM()', :limit => 30
  end
  
  def contact
  end
  
  def accessibility
  end
end
