class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name, unique: true, null: false
      t.string :description
      t.timestamps null: false
    end
  end
end
