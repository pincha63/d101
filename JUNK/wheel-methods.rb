module WheelHelpers
  def wheels_find
    @wheels = Wheel.all
  end

  def wheel_find
    Wheel.get(params[:id]) 
  end
  
  def wheel_create
    @wheel = Wheel.create(params[:wheel])
  end
end
helpers WheelHelpers

get '/wheels' do #show list of wheels
  wheels_find
  slim :wheels
end

get '/wheels/new' do
  @wheel = Wheel.new
  slim :wheel_new
end

post '/wheels' do
  wheel_create
  if Project.get(@wheel.project_id)
     redirect to("/wheels/#{@wheel.id}")
   else
     @wheel.destroy
     redirect to("/wheels")
   end
end

get '/wheels/:id' do
  @wheel = wheel_find
  slim :wheel_show
end

put '/wheels/:id' do
  wheel = wheel_find
  wheel.update(params[:wheel])
  redirect to("/wheels/#{wheel.id}")
end

delete '/wheels/:id' do
  wheel_find.fieldinwheels.destroy
  wheel_find.days.destroy
  wheel_find.destroy
  redirect to('/wheels')
end

get '/wheels/:id/edit' do
  @wheel = wheel_find
  slim :wheel_edit
end
