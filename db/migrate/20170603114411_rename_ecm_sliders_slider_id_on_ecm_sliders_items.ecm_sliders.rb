# This migration comes from ecm_sliders (originally 20170603114217)
class RenameEcmSlidersSliderIdOnEcmSlidersItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :ecm_sliders_items, :ecm_sliders_slider_id, :slider_id
  end
end
