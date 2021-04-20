require "pg"

class Bookmark
  attr_reader :name

  def initialize(name = "default name")
    @name = name
  end

  def self.all
    conn = PG.connect(dbname: choose_database)
    conn.exec("SELECT * FROM bookmarks").map {
      |bookmark|
      bookmark["url"]
    }
  end

  def self.create(link)
    conn = PG.connect(dbname: choose_database)
    conn.exec("INSERT INTO bookmarks (url) VALUES('#{link}')")
  end

  private
  def self.choose_database
    ENV["RACK_ENV"] == "test" ?  "bookmark_manager_test" :  "bookmark_manager"
  end
end
