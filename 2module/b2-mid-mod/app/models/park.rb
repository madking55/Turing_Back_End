class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :admission

  def admission_to_currency
    "$#{'%.2f' % admission}"
  end
end