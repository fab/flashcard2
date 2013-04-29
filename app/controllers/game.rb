get '/deck/:id/play' do
  session[:game_id] = nil # Isn't this line redundant since we overwrite on line 5?
  @deck = Deck.find(params[:id])
  @game = Game.create(user_id: session[:user_id], deck_id: @deck.id) 
  session[:game_id] = @game.id
  session[:start_time] = Time.now
  erb :game
end

post '/check_answer' do
  result = Card.find(params['card_id']).answer == params['answer'] 
  r = Round.create(card_id: params['card_id'], correct: result, game_id: session[:game_id])
  result.to_s
end

get '/game/results' do
  @game = Game.find(session[:game_id])
  @total_time = Time.now - session[:start_time]
  puts @total_time.class
  erb :results
end


# we need to give a game id to a session; so game/results can demonstrate the 
# game resuls
