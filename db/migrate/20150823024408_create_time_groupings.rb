class CreateTimeGroupings < ActiveRecord::Migration
  def change
    create_table :time_groupings do |t|
      t.belongs_to :universe, unique: true, null: false
      t.string :era_name
      t.string :slot_1_name
      t.string :slot_2_name
      t.string :slot_3_name
      t.string :slot_4_name
      t.string :slot_5_name
      t.string :slot_6_name
      t.string :slot_7_name
      t.string :slot_8_name
      t.string :format, null: false
      t.timestamps null: false
    end
  end
end
