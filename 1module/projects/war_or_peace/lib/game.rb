class Game

  attr_reader :player1, :player2
  attr_accessor :turns_count


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turns_count = 0
  end

  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p '------------------------------------------------------------------'

    user_input = gets.chomp.upcase
    if user_input == 'GO'
      take_turn
    else
      p "In order to start the game type 'GO'"
    end
  end

  def take_turn
    turn = Turn.new(player1, player2)

    if turn.type == :basic
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @turns_count += 1
      p "Turn #{turns_count}: #{winner.name} won 2 cards"
    elsif turn.type == :war
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      @turns_count += 1
      p "Turn #{turns_count}: WAR - #{winner.name} won 6 cards"
    elsif turn.type == :mutually_assured_destruction
      turn.pile_cards
      @turns_count += 1
      p "Turn #{turns_count}: *#{turn.type}* 6 cards removed from play"
    end
    continue_game
  end

  def continue_game
    if player1.has_lost? || player2.has_lost? || turns_count == 20
      end_game
    else
      take_turn
    end
  end

  def end_game
    if player1.has_lost?
      "*~*~*~*  #{player2.name} has won the game! *~*~*~*"
    elsif player2.has_lost?
      "*~*~*~*  #{player1.name} has won the game! *~*~*~*"
    else
      p '---- DRAW ----'
    end
  end
end
