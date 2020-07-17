require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end
  
  describe 'relationships' do
    it { should belong_to :owner }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'methods' do
    it '#average_snacks_price' do
      bob = Owner.create(name: "Bob's Burgers")
      burgers = bob.machines.create!(location: "Bob's Food Track")
      castle_burger = Snack.create!(name: 'White Castle Burger', price: 3.5)
      pop_rocks = Snack.create!(name: "Pop Rocks", price: 1.5)
      hot_cheetos = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

      MachineSnack.create!(machine: burgers, snack: castle_burger)
      MachineSnack.create!(machine: burgers, snack: pop_rocks)
      MachineSnack.create!(machine: burgers, snack: hot_cheetos)
      
      expect(burgers.average_snacks_price).to eq(2.5)
    end

    it '#snacks_count' do
      bob = Owner.create(name: "Bob's Burgers")
      burgers = bob.machines.create!(location: "Bob's Food Track")
      castle_burger = Snack.create!(name: 'White Castle Burger', price: 3.5)
      pop_rocks = Snack.create!(name: "Pop Rocks", price: 1.5)
      hot_cheetos = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

      MachineSnack.create!(machine: burgers, snack: castle_burger)
      MachineSnack.create!(machine: burgers, snack: pop_rocks)
      MachineSnack.create!(machine: burgers, snack: hot_cheetos)
      
      expect(burgers.snacks_count).to eq(3)
    end
  end
end
