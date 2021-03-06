class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :trip, foreign_key: true
      t.date :date
      t.string :text

      t.timestamps
    end
  end
end
