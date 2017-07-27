# This migration comes from ecm_sliders (originally 20170603114108)
class RemoveCounterCacheFromEcmSlidersSliders < ActiveRecord::Migration[5.1]
  def change
    remove_column :ecm_sliders_items, :ecm_sliders_items_count
  end
end
