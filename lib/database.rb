require 'pg'

  
module Database

  def self.select_all
    Database.connect.exec "SELECT * FROM #{Bookmark.tb_name};"
  end

  def self.add(url, title)
    Database.connect.exec("INSERT INTO #{Bookmark.tb_name} (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
  end
  
  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "#{Bookmark.db_name}_test")
    else
      connection = PG.connect(dbname: Bookmark.db_name)
    end  
  end
end