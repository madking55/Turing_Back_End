class Machine < ApplicationRecord
  validates_presence_of :location
  
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_snacks_price
    snacks.empty? ? 'No Snacks in the Machine': snacks.average(:price)
  end
end
