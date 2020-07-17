require 'rails_helper'

RSpec.describe 'When I visit a snack show page', type: :feature do
  it 'the can see snack name, location list with vending machines, average snack price and count for different items' do

    bob = Owner.create(name: "Bob's Foods")
    burgers = bob.machines.create!(location: "Bob's Burgers")
    cheetos = bob.machines.create!(location: "Bob's Cheetos")
    hot_cheetos = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)
    castle_burger = Snack.create!(name: 'White Castle Burger', price: 3.5)
    pop_rocks = Snack.create!(name: "Pop Rocks", price: 1.5)
   
    MachineSnack.create!(machine: cheetos, snack: hot_cheetos)
    MachineSnack.create!(machine: cheetos, snack: castle_burger)
    MachineSnack.create!(machine: burgers, snack: hot_cheetos)
    MachineSnack.create!(machine: burgers, snack: castle_burger)
    MachineSnack.create!(machine: burgers, snack: pop_rocks)

    visit "/snacks/#{hot_cheetos.id}"

    expect(page).to have_content('Name: Flaming Hot Cheetos')
    expect(page).to have_content('Price: $2.5')
    expect(page).to have_content("Bob's Cheetos (2 kinds of snacks, average price of $3.0)")
    expect(page).to have_content("Bob's Burgers (3 kinds of snacks, average price of $2.5)")
  end
end