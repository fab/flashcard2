get '/deck/:id/play' do
  @deck = Deck.find(params[:id])
  erb :game
end

post '/check_answer' do
  p params
  puts data = Card.find(params['card_id']).answer == params['answer'] 
  data.to_s
  #store card, session[:user_id] in round table
  #return true/false or whatever
end
