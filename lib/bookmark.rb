require './lib/database'

class Bookmark

  def self.all
    bookmarks = Database.select_all('bookmark_manager', 'bookmarks')
    bookmarks.map { |bookmark_row|  {title: bookmark_row['title'], url: bookmark_row['url']} }
    # this method returns an array of hashes with titles and urls
    # {:title=>"Test title", :url=>"google.com"}, {:title=>"Guardian", :url=>"guardian.com"}]
  end
    
  def self.add(url, title)
    Database.add('bookmark_manager', 'bookmarks', url, title)
  end
end

#Walkthrough 
# class Bookmark

#   attr_reader :id, :title, :url

#   def initialize(id:, title:, url:)
#     @id  = id
#     @title = title
#     @url = url
#   end

#   ### rest of the class ###
# end