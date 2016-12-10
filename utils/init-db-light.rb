require 'sinatra'
require 'dm-core'
require 'dm-migrations'

puts "Show"
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/d101.db")  

load './class-definitions-light.rb'

DataMapper.finalize
x='49'
puts "Enter 48 to migrate, 47 to upgrade, any other number to just finalize" 
x = gets.chomp
if x == '48'
   puts "Auto-migrating..."
   DataMapper.auto_migrate!
elsif x == '47'
   puts "Auto-upgrading..."
   DataMapper.auto_upgrade!
else
   puts "No operation"
end
