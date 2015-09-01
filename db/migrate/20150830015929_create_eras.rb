class CreateEras < ActiveRecord::Migration
  def change
    create_table :eras do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.string :description
      t.belongs_to :universe, null: false
      t.integer :sequence, null: false
      t.timestamps null: false
    end
  end
end
