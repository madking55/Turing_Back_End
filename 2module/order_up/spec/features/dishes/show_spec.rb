RSpec.describe 'Dish Show Page' do

  it 'shows list of ingredients for that dish and the chef name' do
    gordon = Chef.create!(name: "Gordon Ramsey")
    bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
    pasta = Ingredient.create!(name: 'Pasta', calories: 250)
    tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
    olive_oil = Ingredient.create!(name: "Olive Oil", calories: 563)
    potato = Ingredient.create!(name: 'Potato', calories: 50)

    DishIngredient.create!(dish: bolognese, ingredient: pasta)
    DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
    DishIngredient.create!(dish: bolognese, ingredient: olive_oil)

    visit dish_path(bolognese)

    expect(page).to have_content("Dish: #{bolognese.name}")
    expect(page).to have_content("Chef: #{gordon.name}")
    within('.ingredients_list') do
      expect(page).to have_content(pasta.name)
      expect(page).to have_content(tomato_sauce.name)
      expect(page).to have_content(olive_oil.name)
      expect(page).to_not have_content(potato.name)
    end
  end

  it 'shows total calories count for that dish' do
    gordon = Chef.create!(name: "Gordon Ramsey")
    bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
    pasta = Ingredient.create!(name: 'Pasta', calories: 250)
    tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
    olive_oil = Ingredient.create!(name: "Olive Oil", calories: 550)
    potato = Ingredient.create!(name: 'Potato', calories: 50)

    DishIngredient.create!(dish: bolognese, ingredient: pasta)
    DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
    DishIngredient.create!(dish: bolognese, ingredient: olive_oil)

    visit dish_path(bolognese)

    expect(page).to have_content("Total Calories: #{bolognese.total_calories}")
  end
end 