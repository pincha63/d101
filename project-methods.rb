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

get '/projects/new' do
  @project = Project.new
  slim :project_new
end

post '/projects' do
  project_create
  redirect to("/projects/#{@project.id}")
end

get '/projects/:id' do
  @project = project_find
  slim :project_show
end

put '/projects/:id' do
  project = project_find
  project.update(params[:project])
  redirect to("/projects/#{project.id}")
end

delete '/projects/:id' do
  project_find.wheels.destroy
  project_find.destroy
  redirect to('/projects')
end

get '/projects/:id/edit' do
  @project = project_find
  slim :project_edit
end
