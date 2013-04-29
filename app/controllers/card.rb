get '/card/:id' do
  @card = Card.find(params[:id])
  @played_count = Round.where("card_id = ?", @card.id).count
  @wrong_count = Round.where("card_id = ? and correct = false", @card.id).count

  @player_played_count = Round.joins(:game).where("rounds.card_id = ? and games.user_id = ?", 357, 2).count
  @player_wrong_count = Round.joins(:game).where("rounds.card_id = ? and games.user_id = ? and rounds.correct = false", 357, 2).count

  erb :card_profile
end
