class Park < ApplicationRecord
  validates_presence_of :name, :admission
  has_many :rides
end