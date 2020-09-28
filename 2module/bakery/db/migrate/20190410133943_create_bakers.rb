class CreateBakers < ActiveRecord::Migration[5.1]
  def change
    create_table :bakers do |t|
      t.string :name
    end
  end
end
