module DayfieldHelpers
  def dayfields_find
    @dayfields = Dayfield.all
  end

  def dayfield_find
    Dayfield.get(params[:id]) 
  end
  
  def dayfield_create
    @dayfield = Dayfield.create(params[:dayfield])
  end
end
helpers DayfieldHelpers

get '/dayfields' do #show list of dayfields
  dayfields_find
  slim :dayfields
end

get '/dayfields/new' do
  @dayfield = Dayfield.new
  slim :dayfield_new
end

post '/dayfields' do
  dayfield_create
  redirect to("/dayfields/#{@dayfield.id}")
end

get '/dayfields/:id' do
  @dayfield = dayfield_find
  slim :dayfield_show
end

put '/dayfields/:id' do
  dayfield = dayfield_find
  dayfield.update(params[:dayfield])
  redirect to("/dayfields/#{dayfield.id}")
end

delete '/dayfields/:id' do
  dayfield_find.fieldvalues.destroy
  dayfield_find.fieldinwheels.destroy
  dayfield_find.destroy
  redirect to('/dayfields')
end

get '/dayfields/:id/edit' do
  @dayfield = dayfield_find
  slim :dayfield_edit
end
