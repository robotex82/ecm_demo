# This migration comes from ecm_staff (originally 2)
class CreateEcmStaffBusinessUnits < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_staff_business_units do |t|
      t.references :organisation

      t.string :name
      t.text :description

      # acts as markup
      t.string :markup_language

      # friendly id
      t.string :slug

      # awesome nested set
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :ecm_staff_business_units, :organisation_id
    add_index :ecm_staff_business_units, :parent_id
  end
end
