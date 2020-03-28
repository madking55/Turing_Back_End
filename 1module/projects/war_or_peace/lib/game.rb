class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p '------------------------------------------------------------------'

    user_input = gets.chomp.upcase

    if user_input == 'GO'
      play_game
    else
      p "In order to play the game type 'GO'"
    end
  end

  def play_game
    turns_count = 0
    turn = Turn.new(player1, player2)
    
    until player1.has_lost? || player2.has_lost?
      if turn.type == :basic
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turns_count += 1
        p "Turn #{turns_count}: #{winner.name} won 2 cards"
      elsif turn.type == :war
        winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)
        turns_count += 1
        p "Turn #{turns_count}: WAR - #{winner.name} won 6 cards"
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        turns_count += 1
        p "Turn #{turns_count}: *#{turn.type}* 6 cards removed from play"
      end

      break if turns_count == 1000
    end

    if player1.has_lost?
      "*~*~*~*  #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      "*~*~*~*  #{player1.name} has won the game! *~*~*~*"
    else
      p '---- DRAW ----'
    end
  end
end
