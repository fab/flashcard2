require 'faker'
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


def seed_users(names)
  names.each do |name| 
    stuck_together = name.downcase.gsub(/\s/, '')
    User.create(name: name, email: "#{stuck_together}@dbc.com", password: "password", image: "#{stuck_together}.jpeg")
  end
end
users = ["Adam Sartell", "Allen Lee", "Amy Lukima", "Angie Bui", "Chris Torstenson", "Fab Mackojc", "Jkai Hsu", "Kahley Avalon Emerson", "Kristine Hines", "Michael Malchak", "Patrick Scanlan", "Robby Fairclough", "Robert Kim", "Ryan Salomon", "Mac Browning", "Sean Miller", "Sidney Zhang", "Stephen Nguyen", "Sam Miyakawa", "Vincent Storme"]
seed_users(users)



def play_games(num)
  decks = Deck.all
  users = User.all
  num.times do 
    deck = decks.sample
    user = users.sample
    game = Game.create(user_id: user.id, deck_id: deck.id)
    deck.cards.each do |card|
      Round.create(card_id: card.id, game_id: game.id, correct: [true,false].sample )
    end
  end
end
play_games(1000)
