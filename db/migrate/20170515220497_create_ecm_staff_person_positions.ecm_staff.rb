# This migration comes from ecm_staff (originally 4)
class CreateEcmStaffPersonPositions < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_staff_person_positions do |t|
      t.references :person
      t.references :business_unit
      t.references :position

      t.date :begin_at
      t.date :end_at

      t.timestamps
    end
    add_index :ecm_staff_person_positions, :person_id
    add_index :ecm_staff_person_positions, :business_unit_id
    add_index :ecm_staff_person_positions, :position_id
  end
end
