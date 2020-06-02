class Exhibit
attr_reader :name, :cost
  def initialize(exhibit_params)
    @name = exhibit_params[:name]
    @cost = exhibit_params[:cost]
  end

  def patrons(patron_list)
    patrons = []
    patron_list.each do |patron|
      if patron.interests.include?(@name)
        patrons << patron
      end
    end
    patrons
  end
end