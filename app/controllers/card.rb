get '/card/:id' do
  @card = Card.find(params[:id])
  @played_count = Round.where("card_id = ?", @card.id).count
  @wrong_count = Round.where("card_id = ? and correct = false", @card.id).count

  @player_played_count = Round.joins(:game).where("rounds.card_id = ? and games.user_id = ?", @card.id, session[:user_id]).count
  @player_wrong_count = Round.joins(:game).where("rounds.card_id = ? and games.user_id = ? and rounds.correct = false", @card.id, session[:user_id]).count

  @biggest_losers = Game.joins(:rounds, :user).select('games.user_id, count(games.user_id)').where('rounds.correct = false and rounds.card_id = ?', @card.id ).group('games.user_id').order('count(games.user_id) DESC').limit(5)
  p @biggest_losers
  erb :card_profile
end
