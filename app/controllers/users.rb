

post '/login' do
  user = User.authenticate(params["email"], params["password"])
  return 404 unless user
  session[:user_id] = user.id
  redirect '/profile'
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/register' do
  erb :registration
end

post '/register' do
  erb :index
end

get '/profile' do
  @user = User.find(session[:user_id])
  partial(:profile, :user => @user)
end
