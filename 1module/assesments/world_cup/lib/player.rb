class Player
attr_reader :name, :position

  def initialize(attributes)
    @name = attributes[:name]
    @position = attributes[:position]
  end
  
end