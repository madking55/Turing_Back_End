require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  it 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'they see name and price of all snacks in that machine' do
    bob = Owner.create(name: "Bob's Burgers")
    burgers = bob.machines.create!(location: "Bob's Food Track")
    castle_burger = Snack.create!(name: 'White Castle Burger', price: 3.5)
    pop_rocks = Snack.create!(name: "Pop Rocks", price: 1.5)
    hot_cheetos = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create!(machine: burgers, snack: castle_burger)
    MachineSnack.create!(machine: burgers, snack: pop_rocks)
    MachineSnack.create!(machine: burgers, snack: hot_cheetos)

    visit "/machines/#{burgers.id}"

    expect(page).to have_content("White Castle Burger: $3.5")
    expect(page).to have_content("Pop Rocks: $1.5")
    expect(page).to have_content("Flaming Hot Cheetos: $2.5")
  end

  it 'they see an average price for all the snacks in that machine' do
    bob = Owner.create(name: "Bob's Burgers")
    burgers = bob.machines.create!(location: "Bob's Food Track")
    castle_burger = Snack.create!(name: 'White Castle Burger', price: 3.5)
    pop_rocks = Snack.create!(name: "Pop Rocks", price: 1.5)
    hot_cheetos = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create!(machine: burgers, snack: castle_burger)
    MachineSnack.create!(machine: burgers, snack: pop_rocks)
    MachineSnack.create!(machine: burgers, snack: hot_cheetos)

    visit "/machines/#{burgers.id}"

    expect(page).to have_content("Average Price: $2.5")
  end
end
