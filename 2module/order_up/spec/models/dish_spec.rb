RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'methods' do
    describe '#total_calories' do
      it 'shows total calories for the dish' do 
        gordon = Chef.create!(name: "Gordon Ramsey")
        bolognese = gordon.dishes.create!(name: 'Spaghetti Bolognese', description: 'Italian dish with a twist')
        pasta = Ingredient.create!(name: 'Pasta', calories: 250)
        tomato_sauce = Ingredient.create(name: 'Tomato Sauce', calories: 150)
        olive_oil = Ingredient.create!(name: "Olive Oil", calories: 550)
        potato = Ingredient.create!(name: 'Potato', calories: 50)
    
        DishIngredient.create!(dish: bolognese, ingredient: pasta)
        DishIngredient.create!(dish: bolognese, ingredient: tomato_sauce)
        DishIngredient.create!(dish: bolognese, ingredient: olive_oil)

        expect(bolognese.total_calories).to eq(950)
      end
    end
  end
end
