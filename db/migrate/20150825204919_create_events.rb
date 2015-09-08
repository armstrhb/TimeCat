class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :time_instant, null: false
      t.belongs_to :part_of
      t.belongs_to :universe, null: false
      t.timestamps null: false
    end

    create_table :event_locations, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :location, index: true
    end

    create_table :event_people, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :person, index: true
    end
  end
end
