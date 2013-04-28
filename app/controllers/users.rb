

post '/login' do
  p params
  user = User.authenticate(params["email"], params["password"])
  return 404 unless user
  session[:user_id] = user.id
  redirect '/profile'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/register' do  
  p params
  user = User.create(name: params["name"], 
                     email: params["email"], 
                     password: params["password"])
  @errors = user.errors.full_messages
  if @errors.length > 0
    return partial(:_errors, :errors => @errors)
  end
  session[:user_id] = user.id
  redirect '/profile'
end

get '/profile' do
  @user = User.find(session[:user_id])
  @decks = Deck.all
  partial(:profile, {:decks => @decks})
end



