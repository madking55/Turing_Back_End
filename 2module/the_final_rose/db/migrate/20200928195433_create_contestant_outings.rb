class CreateContestantOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :contestant_outings do |t|
      t.references :outing, foreign_key: true
      t.references :contestant, foreign_key: true

      t.timestamps
    end
  end
end
