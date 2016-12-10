require 'sinatra'
require 'sinatra/reloader' if development?
#require 'sinatra/flash'
require 'slim'
require 'sass'
require './classes'
require './my_methods'

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

not_found do #404
  slim :not_found
 end
 