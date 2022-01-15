require 'pg'

  
module Database

  def self.select_all
    Database.connect.exec_params"SELECT * FROM bookmarks;"
  end

  def self.add(url, title)
    Database.connect.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, url, title;", [url, title])
  end
  
  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end  
  end
end