get '/deck/:id/play' do
  @deck = Deck.find(params[:id])
  erb :game
end

post '/check_answer' do
  result = Card.find(params['card_id']).answer == params['answer'] 
  r = Round.create(user_id: session[:user_id], card_id: params['card_id'], correct: result)
  result.to_s
end

get '/game/results' do
  erb :results
end
