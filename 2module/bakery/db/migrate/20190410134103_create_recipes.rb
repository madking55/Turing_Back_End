class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :number_ingredients
      t.integer :bake_time
      t.integer :oven_temp
      t.references :baker, foreign_key: true
    end
  end
end
