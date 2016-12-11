require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'
#require 'sinatra/flash'
#require './classes'
#require './my_methods'

require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/d101.db")  
end
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

#data-related files to include
require './class-definitions'
require './user-methods'
require './project-methods'
require './wheel-methods'
require './field-methods'
require './day-methods'

DataMapper.finalize

helpers do
  def css(*stylesheets)
    stylesheets.map do |myStylesheet|
      "<link href=\"/#{myStylesheet}.css\"
      media=\"screen, projection\" rel=\"stylesheet\" />"
    end.join
  end
  
  def current?(path='/')
    minlen = path.length
    (request.path[0,minlen]==path) ? "current" : nil
  end  
  
  def set_title
    @title ||= "Your score today"
  end
end

before do
  set_title
end

get ('/styles.css'){scss :styles}

get ('/') do
  slim :home
end

get '/about' do
  @title = "About"
  slim :about
end

get '/env' do
  @title = "Environment Detect"
  slim :env
end

get '/info' do
  @title = "Info on Wheels"
  slim :info
end

not_found do #404
  slim :not_found
 end