class ChangePriceToBeFloatInSnacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :snacks, :price, :string
    add_column :snacks, :price, :decimal
  end
end
