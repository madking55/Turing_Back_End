RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    describe "#uniq_ingredients" do
      it 'lists all unique ingredients that this chef uses' do
        gordon = Chef.create!(name: "Gordon Ramsey")
        bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
        pizza = gordon.dishes.create!(name: 'Pizza', description: 'Italian pizza with a twist')
        pasta = Ingredient.create!(name: 'Pasta', calories: 250)
        tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
        olive_oil = Ingredient.create!(name: "Olive Oil", calories: 550)
        pesto = Ingredient.create!(name: 'Pesto', calories: 150)
    
        DishIngredient.create!(dish: bolognese, ingredient: pasta)
        DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
        DishIngredient.create!(dish: bolognese, ingredient: olive_oil)
        DishIngredient.create!(dish: pizza, ingredient: tomato_sauce)
        DishIngredient.create!(dish: pizza, ingredient: olive_oil)
        DishIngredient.create!(dish: pizza, ingredient: pesto)

        expect(gordon.uniq_ingredients).to eq([pasta, tomato_sauce, olive_oil, pesto])
        expect(gordon.uniq_ingredients.count).to eq(4)
      end
    end

    describe '#top_three_ingredients' do
      it 'lists three most popular ingredients that the chef uses in their dishes' do
        gordon = Chef.create!(name: "Gordon Ramsey")
        bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
        pizza = gordon.dishes.create!(name: 'Pizza', description: 'Italian pizza with a twist')
        caprese = gordon.dishes.create!(name: 'Caprese', description: 'Italian salad with a twist' )
        pasta = Ingredient.create!(name: 'Pasta', calories: 250)
        olive_oil = Ingredient.create!(name: "Olive Oil", calories: 550)
        pesto = Ingredient.create!(name: 'Pesto', calories: 150)
        tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
    
        DishIngredient.create!(dish: bolognese, ingredient: olive_oil)
        DishIngredient.create!(dish: pizza, ingredient: olive_oil)
        DishIngredient.create!(dish: caprese, ingredient: olive_oil)
        DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
        DishIngredient.create!(dish: pizza, ingredient: tomato_sauce)
        DishIngredient.create!(dish: pizza, ingredient: pesto)
        DishIngredient.create!(dish: caprese, ingredient: pesto)

        expect(gordon.top_three_ingredients).to eq([olive_oil.name, pesto.name, tomato_sauce.name])
      end
    end
  end
end
