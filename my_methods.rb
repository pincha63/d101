helpers do
  def create_youtube(vref)
    refshort = "<iframe width=\"560\" height=\"315\" src=\""
	refpre = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/"
	refpost = "\" frameborder=\"0\" allowfullscreen></iframe>" 
	if vref.length < 15
		refpre + vref + refpost
	elsif vref.length < 48
		refshort + vref + refpost
	else
		vref
    end
  end
  
  def songUsers(mySong)
    collectUsers=[]
	mySong.tags.each do |aTag|
	    aTag.usertags.each do |myUT|   
			myUser = User.get(myUT.user_id)
	        collectUsers.push(myUser)
		end
	end
	userList= ""
	collectUsers.uniq.sort_by{|u| u.username.capitalize}.each do |myU|
        userList += "<a href=\"/users/" + myU.id.to_s + "\">" + myU.username + "</a>, " 
	end
	userList.length > 3 ? userList.chop.chop : "No user... yet"
  end  

  def allDaysInProject(myProject)
	myProject.wheels.sort_by{|w| w.place_in_project}.each do |myWheel|
	  puts myWheel.place_in_project.to_s + " : " + myWheel.wname
      myWheel.days.sort_by{|d| d.place_in_wheel}.each do |myDay|     
	    puts myDay.place_in_wheel.to_s + " : " + myWheel.wname
	  end
    end 
  end  
end