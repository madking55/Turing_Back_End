class Contestant

  attr_reader :age, :state_of_residence, :spending_money, :game_interests

  def initialize(contestant_params)
    @first_name = contestant_params[:first_name]
    @last_name = contestant_params[:last_name]
    @age = contestant_params[:age]
    @state_of_residence = contestant_params[:state_of_residence]
    @spending_money = contestant_params[:spending_money]
    @game_interests = []
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end
end