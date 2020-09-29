class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def contestants_count
    contestants.count
  end

  def contestants_names
    unless contestants_count.zero?
      contestants.pluck(:name)
    else
      'No Contestants Yet'
    end
  end
end