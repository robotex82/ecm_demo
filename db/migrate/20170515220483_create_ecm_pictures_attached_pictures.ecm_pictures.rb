# This migration comes from ecm_pictures (originally 3)
class CreateEcmPicturesAttachedPictures < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_pictures_attached_pictures do |t|
      t.references :ecm_pictures_picture
      t.references :pictureable, polymorphic: true
      t.timestamps
    end
  end
end
