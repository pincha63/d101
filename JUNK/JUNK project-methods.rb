get '/projects/:proj/wheel/new' do
  @wheel = Wheel.new
  @project = params[:proj]
  slim :wheel_new
end

post '/projects/:proj/wheels' do
  @wheel = Wheel.create(params[:wheel])
  @project = Project.get(params[:proj])
  redirect to("/projects/#{@project.id}")
end



