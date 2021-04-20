require "pg"

def add_test_bookmarks
  conn = PG.connect(dbname: "bookmark_manager_test")
  conn.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers')")
  conn.exec("INSERT INTO bookmarks(url, title) VALUES('http://askjeeves.com', 'Askjeeves')")
  conn.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.google.com', 'Google')")
end
