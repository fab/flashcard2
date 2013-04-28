get '/' do
  erb :index
end

get '/header' do
  partial :_header
end
