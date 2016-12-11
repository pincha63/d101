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

get '/wheels/:id' do #show individual wheel
  @wheel = wheel_find
  slim :wheel_show
end

get '/wheels/info/:id' do #show individual wheel
  @wheel = wheel_find
  slim :wheel_info
end

delete '/wheels/:id' do
  wheel_find.fieldinwheels.destroy
  wheel_find.days.destroy
  wheel_find.destroy
  redirect to('/wheels')
end

get '/assign/:wheel/:field/:pos' do
    @myId = params[:wheel]
    @myField = params[:field]
    @myPos = params[:pos]
    Fieldinwheel.create(place_in_wheel: @myPos, wheel_id: @myId, dayfield_id: @myField)
    @wheel = Wheel.get(@myId)
	redirect to("/wheels/#{@myId}")
end

get '/unassign/:wheel/:field' do
    @myId = params[:wheel]
    @myField = params[:field]
    Fieldinwheel.each do |fw|
	  if (fw.wheel_id == @myId) && (fw.dayfield_id == @myField)
		fw.destroy
	  end
	end
    slim :wrong
#	redirect to("/wheels/#{@myId}")
end