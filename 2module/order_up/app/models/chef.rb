class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def uniq_ingredients
    ingredients.distinct
  end

  def top_three_ingredients
    ingredients.select('ingredients.*').group('ingredients.id').order('count(ingredients) DESC').pluck('ingredients.name')
  end
end
