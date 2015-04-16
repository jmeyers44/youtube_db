require 'sqlite3'
require_relative '../lib/YouTube_Data'
require_relative '..bin/runner'

DB = SQLite3::Database.new("db/YouTube_Vids.db")