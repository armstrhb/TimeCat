class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :universe, null: false
      t.belongs_to :part_of
      t.timestamps null: false
    end
  end
end
