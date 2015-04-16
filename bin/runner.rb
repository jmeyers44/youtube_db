require_relative '../lib/YouTube_Data.rb'

# DB = SQLite3::Database.new("db/YouTube_Vids.db")

require 'pry'
def run
YouTube.create_table

loop do
puts "new, display or exit"
trial = YouTube.new

user_input = gets.chomp

case user_input
  when "new"
  
  puts "Enter a YouTube Video Name"
  trial.name = gets.chomp
  puts "Enter a genre"
  trial.genre = gets.chomp
  puts "Enter the url"
  trial.video_url = gets.chomp
  trial.save
  when "display"
   #  show = DB.execute("SELECT * FROM YouTube_Vids;")
   # puts show
   puts YouTube.display
  when "clear"
     sql = <<-SQL
    DROP TABLE YouTube_Vids
    SQL
    DB.execute(sql)
  when "exit"
    break
  end
end

end 

run 


=begin
QUESTIONS
how to access class methods from outside the class
Where is this database stored if not in my DB file
is this the right way to set up a runner file? 
Do I need to put the DB = SQLite.... in the top of this file
Quick refresher on require relative and how the enviroment file fits in.
Is env even being called?
=end