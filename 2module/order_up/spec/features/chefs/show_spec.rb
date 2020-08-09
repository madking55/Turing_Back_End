RSpec.describe 'Chef Show Page' do
  it 'has a link to view all chef ingredients' do
    gordon = Chef.create!(name: "Gordon Ramsey")
    bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
    pasta = Ingredient.create!(name: 'Pasta', calories: 250)
    tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
    olive_oil = Ingredient.create!(name: "Olive Oil", calories: 563)
    potato = Ingredient.create!(name: 'Potato', calories: 50)

    DishIngredient.create!(dish: bolognese, ingredient: pasta)
    DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
    DishIngredient.create!(dish: bolognese, ingredient: olive_oil)

    visit "/chefs/#{gordon.id}"

    expect(page).to have_content("Chef: #{gordon.name}")
    
    click_link "See All Chef's Ingredients"

    expect(current_path).to eq("/chefs/#{gordon.id}/ingredients")
    expect(page).to have_content(pasta.name, count: 1)
    expect(page).to have_content(tomato_sauce.name, count: 1)
    expect(page).to have_content(olive_oil.name, count: 1)
    expect(page).to_not have_content(potato.name)
  end
end
