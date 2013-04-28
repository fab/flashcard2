def parse(filename, deck)
  array = File.readlines(filename).map do |line|
    line.split("\n").delete_if {|string| string == " " } 
  end
  hash = Hash[*array.flatten]
  hash.each { |k, v| deck.cards << Card.create(definition: k, answer: v) }
end

deck1 = Deck.create(name: 'Ruby', category: 'Programming', image_url: '/ruby.png')
filename = APP_ROOT.join('db', 'flashcard_samples.txt')
parse(filename, deck1)

deck2 = Deck.create(name: 'US State Capitals', category: 'Geography', image_url: '/states.jpeg')
filename = APP_ROOT.join('db', 'flashcard_samples2.txt')
parse(filename, deck2)

deck3 = Deck.create(name: 'US Presidents', category: 'History', image_url: '/obama.jpg')
filename = APP_ROOT.join('db', 'us_presidents.txt')
parse(filename, deck3)

deck4 = Deck.create(name: 'One Card Deck', category: 'Test', image_url: '/obama.jpg')
filename = APP_ROOT.join('db', 'test.txt')
parse(filename, deck4)

deck5 = Deck.create(name: 'four card deck', category: 'Test', image_url: '/obama.jpg')
filename = APP_ROOT.join('db', 'flashcard_samples3.txt')
parse(filename, deck5)
