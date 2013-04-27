helpers do
  def partial(template, locals = {})
    erb(template, :layout => false, :locals => locals)
  end

  def three_wrong_answers(card)
    three_cards = @deck.cards.where('id != ?', card.id).sample(3)
    three_cards.map { |card| card.answer }
  end
end
