class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.belongs_to :birth_instant
      t.belongs_to :death_instant
      t.belongs_to :birth_location
      t.belongs_to :residence_location
      t.belongs_to :death_location
      t.timestamps null: false
    end
  end
end
