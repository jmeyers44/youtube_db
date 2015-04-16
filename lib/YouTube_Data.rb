
class YouTube
require 'sqlite3'
require 'pry'

DB = SQLite3::Database.new("db/YouTube_Vids.db")

  attr_accessor :id, :name, :genre, :video_url, :drop_table, :save
  
  
  def self.create_table
  sql = <<-SQL
    CREATE TABLE IF NOT EXISTS YouTube_Vids (
      id INTEGER PRIMARY KEY, 
      name TEXT, 
      genre TEXT, 
      video_url TEXT);
  SQL
  DB.execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    DROP TABLE YouTube_Vids
    SQL
    DB.execute(sql)
  end

  def self.new_from_row(row)
    instance = new
    instance.id = row[0]
    instance
  end

  def self.all
    sql = <<-SQL
      SELECT *
      FROM YouTube_Vids;
    SQL
    DB.execute(sql).map do |row|
      new_from_row(row)
    end
  end

  def insert
    sql = <<-SQL
    INSERT INTO YouTube_Vids (name, genre, video_url)
    VALUES (?, ?, ?);
    SQL
    DB.execute(sql,[name,genre,video_url])
    
    self.id = YouTube.all.last.id
  end

  def self.new_from_db(row)
    s = new
    s.id = row[0]
    s.name = row[1]
    s.genre =row[2] 
    s.video_url = row[3] 
    s
  end

  def self.find_by_name(name)
    sql= <<-SQL
    SELECT * 
    FROM YouTube_Vids
    WHERE name = ?
    SQL
    h = DB.execute(sql,[name])
    if h = h[0]
    new_from_db(h)
  end
  end

  def update
    sql= <<-SQL
    UPDATE YouTube_Vids
    SET name = ?, id = ?
    WHERE id = ?;
    SQL

    DB.execute(sql,[self.name, self.id, self.id])
  end

  def save
    if persisted?
      update
    else
      insert
    end
  end

  def persisted?
    !!id
  end

  def self.display
    sql= <<-SQL
    SELECT * 
    FROM YouTube_Vids
    SQL
    show_me = DB.execute(sql)
    puts show_me

  end
end





