require 'date'
class ColoradoLottery
attr_reader :registered_contestants, :current_contestants, :winners

  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @current_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
  end

  def interested_and_18?(contestant, game)
    contestant.game_interests.include?(game.name) && contestant.age >= 18 
  end
  
  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    registered_contestants[game.name] << contestant if can_register?(contestant, game)
  end

  def eligible_contestants(game)
    # eligible_contestants is a list of all the contestants who have been registered to play a given game and that have more spending_money than the cost.
    registered_contestants[game.name].select { |contestant| contestant.spending_money >= game.cost }
  end
  
  def charge_contestants(game)
  # current_contestants are lists of contestant names who have been charged, organized by game
    eligible_contestants(game).each do |contestant|
      contestant.spending_money -= game.cost
      current_contestants[game] << contestant.full_name
    end
  end

  def draw_winners
  #  returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants
    current_contestants.each { |game, contestants| @winners << { contestants.sample => game.name } }
    Date.today.to_s
  end

  def winner(game_name)
    winner = nil
    @winners.each do |winner_hash|
      winner = winner_hash.key(game_name) if winner_hash.key(game_name) != nil
    end
    winner
  end

  def announce_winner(game_name)
    date = draw_winners[-5..-1].sub('-', '/')
    "#{winner(game_name)} won the #{game_name} on #{date}"
  end

end