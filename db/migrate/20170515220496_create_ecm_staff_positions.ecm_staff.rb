# This migration comes from ecm_staff (originally 3)
class CreateEcmStaffPositions < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_staff_positions do |t|
      t.string :name
      t.text :description

      # acts as markup
      t.string :markup_language

      # awesome nested set
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      # friendly id
      t.string :slug

      t.timestamps
    end
    add_index :ecm_staff_positions, :parent_id
  end
end
