get '/' do
  if session[:user_id] 
    redirect '/profile'
  else
    erb :index
  end
end
