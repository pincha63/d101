module ProjectHelpers
  def projects_find
    @projects = Project.all
  end

  def project_find
    Project.get(params[:id]) 
  end
  
  def project_create
    @project = Project.create(params[:project])
  end
end
helpers ProjectHelpers

get '/projects' do #show list of projects
  projects_find
  slim :projects
end

get '/projects/new' do #start creation of new project
  @project = Project.new #the record is nil as of now
  slim :project_new
end

post '/projects' do #called from project_new.slim
  project_create
  # the record is now loaded with the entered values...
  # from the form
  if User.get(@project.user_id)
	 redirect to("/projects/#{@project.id}/wheels")
  else
    # breach of referential integrity (bad parent ref)
    @project.destroy
    redirect to("/projects") 
  end
end

get '/projects/:id' do #show single record
  @project = project_find
  slim :project_show
end

get '/projects/:id/edit' do
  @project = project_find
  slim :project_edit
end

put '/projects/:id' do #update existing record
  project = project_find
  project.update(params[:project])
  redirect to("/projects/#{project.id}")
end

delete '/projects/:id' do
  #delete all descendents to keep ref integrity
  project_find.wheels.destroy
  project_find.destroy
  redirect to('/projects')
end

get '/projects/:proj/wheels' do
# show current wheels for given project, offer to create one (in wheels.slim)
    @project = Project.get(params[:proj]) 
	@wheels  = @project.wheels
    slim :wheels
end

get '/projects/:proj/wheel/new' do
  @wheel = Wheel.new
  #@project = Project.get(params[:proj])
  slim :wheel_new
end

post '/projects/wheels' do
  @wheel = Wheel.create(params[:wheel])
  #create days as specified...
  daysinwheel = @wheel.wlength
  for i in 1..daysinwheel
     myDate = Date.new(2001,2,3) + i - 1
	 Day.create(projectref: "", place_in_wheel: i, actualdate: myDate, wheel_id: @wheel.id)
  end
  redirect to("/wheels/#{@wheel.id}")
end





