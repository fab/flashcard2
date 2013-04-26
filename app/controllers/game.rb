get '/deck/:id/play' do
  @deck = Deck.find(params[:id])
  erb :game
end
