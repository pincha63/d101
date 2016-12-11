module DayHelpers
  def days_find
    @days = Day.all
  end

  def day_find
    Day.get(params[:id]) 
  end
  
  def day_create
    @day = Day.create(params[:day])
  end
end
helpers DayHelpers

get '/days' do #show list of days
  days_find
  slim :days
end

get '/days/new' do
  @day = Day.new
  slim :day_new
end

post '/days' do
  day_create
  redirect to("/days/#{@day.id}")
end

get '/days/:id' do
  @day = day_find
  slim :day_show
end

put '/days/:id' do
  day = day_find
  day.update(params[:day])
  redirect to("/days/#{day.id}")
end

delete '/days/:id' do
  day_find.fieldvalues.destroy
  day_find.destroy
  redirect to('/days')
end

get '/days/:id/edit' do
  @day = day_find
  slim :day_edit
end
