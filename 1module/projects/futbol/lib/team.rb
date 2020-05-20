require 'csv'

class Team

  def self.from_csv(csv_file_path)
    csv = CSV.read("#{csv_file_path}", headers: true, header_converters: :symbol)
    @@all = csv.map { |row| Team.new(row)}
  end

  def self.all
    @@all
  end


  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link

  def initialize(team_params)
    @team_id = team_params[:team_id].to_i
    @franchise_id = team_params[:franchiseid].to_i
    @team_name = team_params[:teamname]
    @abbreviation = team_params[:abbreviation]
    @stadium = team_params[:stadium]
    @link = team_params[:link]
  end
end