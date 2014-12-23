class CreateFillingUtzIntervals < ActiveRecord::Migration
  def change
    create_table :filling_utz_intervals do |t|
      t.integer :start
      t.integer :end
      t.string :answer

      t.timestamps null: false
    end
  end
end
