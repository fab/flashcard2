def parse(filename, deck)
  array = File.readlines(filename).map do |line|
    line.split("\n").delete_if {|string| string == " " } 
  end
  hash = Hash[*array.flatten]
  hash.each { |k, v| deck.cards << Card.create(definition: k, answer: v) }
end

deck1 = Deck.create(name: 'Ruby', category: 'Programming')
filename = APP_ROOT.join('db', 'flashcard_samples.txt')
parse(filename, deck1)

deck2 = Deck.create(name: 'US State Capitals', category: 'Geography')
filename = APP_ROOT.join('db', 'flashcard_samples2.txt')
parse(filename, deck2)
