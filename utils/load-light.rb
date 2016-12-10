User.create(username: "Pincha")
User.create(username: "Lobo")
User.create(username: "River")
User.create(username: "Racing")

Project.create(projectname: "Project 11", user_id: 1)
Project.create(projectname: "Project 12", user_id: 1)
Project.create(projectname: "Project 21", user_id: 2)

Wheel.create(wname: "Wheel 1", wlength: 21, place_in_project: 1, project_id: 1)
Wheel.create(wname: "Wheel 2", wlength: 21, place_in_project: 2, project_id: 1)
Wheel.create(wname: "Wheel 3", wlength: 21, place_in_project: 3, project_id: 1)
Wheel.create(wname: "Lobowheel 1", wlength: 21, place_in_project: 1, project_id: 1)
Wheel.create(wname: "Lobowheel 2", wlength: 21, place_in_project: 2, project_id: 1)
Wheel.create(wname: "Lobowheel 3", wlength: 21, place_in_project: 3, project_id: 1)

Dayfield.create(fieldname: "Exercise", minrange: 0, maxrange: 100)
Dayfield.create(fieldname: "Eating", minrange: 0, maxrange: 100)
Dayfield.create(fieldname: "Breathing", minrange: 0, maxrange: 100)
Dayfield.create(fieldname: "Drinking Water", minrange: 0, maxrange: 100)

Day.create(place_in_wheel: 1, actualdate: Date.new(2001,2,3), wheel_id: 1)
Day.create(place_in_wheel: 2, actualdate: Date.new(2001,2,4), wheel_id: 1)
Day.create(place_in_wheel: 3, actualdate: Date.new(2001,2,5), wheel_id: 1)
Day.create(place_in_wheel: 4, actualdate: Date.new(2001,2,6), wheel_id: 1)

Dayfieldvalue.create(value: 75, day_id: 1)
Dayfieldvalue.create(value: 4, day_id: 2)