class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.belongs_to :person, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
