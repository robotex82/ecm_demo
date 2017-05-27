# This migration comes from ecm_time_tracking (originally 20160408150646)
class CreateEcmTimeTrackingTrackerCalculationSchemas < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_time_tracking_tracker_calculation_schemas do |t|
      t.integer :tracker_id
      t.string :identifier
      t.timestamp :enabled_from
      t.timestamp :enabled_to

      t.timestamps null: false
    end
  end
end
