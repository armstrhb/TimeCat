class CreateTimeInstants < ActiveRecord::Migration
  def change
    create_table :time_instants do |t|
      t.belongs_to :universe, null: false
      t.belongs_to :era, null: false
      t.integer :slot_1, null: false
      t.integer :slot_2
      t.integer :slot_3
      t.integer :slot_4
      t.integer :slot_5
      t.integer :slot_6
      t.integer :slot_7
      t.integer :slot_8
      t.timestamps null: false
    end
  end
end
