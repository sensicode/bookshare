require 'json/pure'

class Title < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :authors
  has_many :books
  
  validates_length_of :title, :minimum => 1
  validates_associated :authors
  validates_isbn :isbn13, :with => :isbn13
  
  def to_param
    isbn13
  end
  
  def isbn10
    # http://rubygems.org/gems/isbn
    ISBN.ten(isbn13)
  end
  
  def title_and_author
    "#{self.title} by #{self.authors.first.name}"
  end
  
  def self.find_or_create_by_isbn13(isbn13)
    
    isbn13.strip!
    
    # Is this a barcode scanned by an unmodified Cuecat reader?
    if isbn13.size == 50
      code = CueCat.new(isbn13[1..50])
      isbn13 = code.value.to_s
    end
    
    t2 = self.find_by_isbn13(isbn13)
    
    unless t2.nil?
      return t2
    end

    # Look up in Google Books API
    t = Title.new
    
    url = "https://www.googleapis.com/books/v1/volumes/?q=%s" % isbn13
    http = HTTPClient.new
    res = http.get(url)
    data = JSON.parse(res.body)

    found_item = nil

    # Loop through result set to find the item with our isbn13
    data['items'].each do |item|
      item['volumeInfo']['industryIdentifiers'].each do |isbn|
        if isbn['type'] == "ISBN_13" && isbn['identifier'] == isbn13
          found_item = item
        end
      end
      break if found_item
    end

    if found_item
      t.title = found_item['volumeInfo']['title']
      t.description = found_item['volumeInfo']['description']
      t.image_url = found_item['volumeInfo']['imageLinks']['smallThumbnail']

      unless found_item['volumeInfo']['authors'].nil?
        found_item['volumeInfo']['authors'].each do |author|
          if a = Author.find_by_name(author)
            t.authors << a
          else
            t.authors << Author.create(:name => author)
          end
        end
      end
        
      unless found_item['volumeInfo']['categories'].nil?
        found_item['volumeInfo']['categories'].each do |subject|
          if s = Subject.find_by_name(subject)
            t.subjects << s
          else
            t.subjects << Subject.create(:name => subject)
          end
        end
      end
        
      t.isbn13 = isbn13
      t.save
      return t
    else
      # We didn't find any item with this ISBN in the API
    end
  end
end
