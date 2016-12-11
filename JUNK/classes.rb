#d101 classes.rb
require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/d101.db")  
end
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

require './class-definitions'
require './user-methods'
require './project-methods'
require './wheel-methods'
require './field-methods'
require './day-methods'

DataMapper.finalize