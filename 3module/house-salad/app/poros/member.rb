class Member
  attr_reader :name, :role, :party, :district
  def initialize(member_data)
    @name = member_data[:name]
    @role = member_data[:role]
    @party = member_data[:party]
    @district = member_data[:district]
  end
end