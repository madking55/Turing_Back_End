class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else
      :basic
    end
  end

  def winner
    if type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif type == :war
     @spoils_of_war << player1.deck.remove_card(3)
     @spoils_of_war << player2.deck.remove_card(3) 
    elsif type == :mutually_assured_destruction
      player1.deck.remove_card(3)
      player2.deck.remove_card(3)
    end
  end

  def award_spoils(winner)
    if winner != 'No Winner'
       @spoils_of_war.size.times { winner.deck.cards << @spoils_of_war.shift }
    end
  end

end