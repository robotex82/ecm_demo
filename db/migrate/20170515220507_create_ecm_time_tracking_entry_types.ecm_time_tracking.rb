# This migration comes from ecm_time_tracking (originally 20160307185539)
class CreateEcmTimeTrackingEntryTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_time_tracking_entry_types do |t|
      t.string :identifier
      t.integer :due_in_seconds

      t.timestamps null: false
    end
  end
end
