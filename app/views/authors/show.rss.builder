xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Books by #{@author.name} at Sutton Bookshare"
    xml.description ""
    xml.link author_url(@author)

    for title in @author.titles.reverse
      xml.item do
        xml.title title.title
        xml.description title.description
        xml.pubDate title.created_at.to_s(:rfc822)
        xml.link title_url(title)
        xml.guid title_url(title)
        xml.isbn13 title.isbn13
      end
    end
  end
end