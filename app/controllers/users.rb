

post '/login' do
  user = User.authenticate(params["email"], params["password"])
  return 404 unless user
  session[:user_id] = user.id
  redirect '/profile'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/register' do
  erb :registration
end

post '/register' do  
  user = User.create(name: params["name"], 
                     email: params["email"], 
                     password: params["password"])
  @errors = user.errors.full_messages
  return @errors if @errors.length > 0
  session[:user_id] = user.id
  redirect '/profile'
end

get '/profile' do
  @user = User.find(session[:user_id])
  @decks = Deck.all
  erb :profile
end



