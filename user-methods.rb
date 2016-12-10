module UserHelpers
  def users_find
    @users = User.all
  end

  def user_find
    User.get(params[:id]) 
  end
  
  def user_create
    @user = User.create(params[:user])
  end
end
helpers UserHelpers

get '/users' do #show list of users
  users_find
  tags_find
  slim :users
end

get '/users/new' do
  @user = User.new
  slim :user_new
end

post '/users' do
  user_create
  redirect to("/users/#{@user.id}")
end

get '/users/:id' do
  @user = user_find
  slim :user_show
end

put '/users/:id' do
  user = user_find
  user.update(params[:user])
  redirect to("/users/#{user.id}")
end

delete '/users/:id' do
  user_find.projects.destroy
  user_find.destroy
  redirect to('/users')
end

get '/users/:id/edit' do
  @user = user_find
  slim :user_edit
end
