require "sqlite3"

dir = File.dirname(__FILE__)
db = SQLite3::Database.new(File.join(dir, "db/lps.db"))

db.execute('DROP TABLE IF EXISTS `lps`;')
create_statement = "
CREATE TABLE `lps` (
  `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  `artist` TEXT,
  `title` TEXT,
  `year` INTEGER, 
  `price` INTEGER
);"
db.execute(create_statement)
