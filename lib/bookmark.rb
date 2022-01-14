require './lib/database'

class Bookmark

  DB_NAME, TB_NAME = 'bookmark_manager', 'bookmarks'
  include Database 

  def self.get_all
    bookmarks = Database.select_all
    bookmarks.map { |dt_hash| Bookmark.new(dt_hash['id'], dt_hash['url'], dt_hash['title'])}
    # this method returns an array of hashes with titles and urls
    # {:title=>"Test title", :url=>"google.com"}, {:title=>"Guardian", :url=>"guardian.com"}]
  end
    
  def self.add(url, title)
    feedback = Database.add(url, title)
    Bookmark.new(feedback[0]['id'], feedback[0]['url'], feedback[0]['title'])
  end

  def self.db_name
    'bookmark_manager'
  end

  def self.tb_name
    'bookmarks'
  end

  attr_reader :id, :title, :url

  def initialize id, url, title
    @id = id
    @url = url
    @title = title
  end

end

