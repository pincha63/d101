require 'dm-core'
require 'dm-migrations'

class User
   include DataMapper::Resource
   property    :id, Serial
   property    :username, String
   has n,      :projects
end

class Project
   include DataMapper::Resource
   property    :id, Serial
   property    :projectname, String
   belongs_to  :user
   has n,      :wheels
end

class Wheel
   include DataMapper::Resource
   property    :id, Serial
   property    :wname, String
   property    :wlength, Integer
   property    :place_in_project, Integer
   belongs_to  :project
   has n,      :days
end

class Dayfield
   include DataMapper::Resource
   property    :id, Serial
   property    :fieldname, String
   property    :minrange, Integer
   property    :maxrange, Integer
end

class Day
   include DataMapper::Resource
   property    :id, Serial
   property    :place_in_wheel, Integer
   property    :actualdate, Date
   belongs_to  :wheel
   has n,      :dayfieldvalues
end

class Dayfieldvalue
   include DataMapper::Resource
   property    :id, Serial
   property    :value, Integer
   belongs_to  :day
end