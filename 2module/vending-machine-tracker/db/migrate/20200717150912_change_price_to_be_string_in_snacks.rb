class ChangePriceToBeStringInSnacks < ActiveRecord::Migration[5.1]
  def change
    change_column :snacks, :price, :string 
  end
end
