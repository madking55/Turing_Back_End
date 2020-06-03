class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select { |dish| dish.category == category }
  end

  def menu
    menu = {}
    @dishes.each do |dish|
      if menu[(dish.category.to_s + 's').to_sym].nil?
      menu[(dish.category.to_s + 's').to_sym] = [dish.name]
      else
      menu[(dish.category.to_s + 's').to_sym] << dish.name
      end
    end
    menu.each { |category, names| names.sort! }
  end

  def ratio(category)
    (get_all_from_category(category).length / dishes.length.to_f) * 100
  end
  
end