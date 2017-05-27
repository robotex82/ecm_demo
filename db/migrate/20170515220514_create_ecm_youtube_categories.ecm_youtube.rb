# This migration comes from ecm_youtube (originally 20151226161813)
class CreateEcmYoutubeCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_youtube_categories do |t|
      t.string :identifier

      t.timestamps null: false
    end
  end
end
