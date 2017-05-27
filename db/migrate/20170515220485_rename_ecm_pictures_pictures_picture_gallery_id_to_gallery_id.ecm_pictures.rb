# This migration comes from ecm_pictures (originally 20160626143414)
class RenameEcmPicturesPicturesPictureGalleryIdToGalleryId < ActiveRecord::Migration[4.2]
  def change
    rename_column :ecm_pictures_pictures, :picture_gallery_id, :gallery_id
  end
end
