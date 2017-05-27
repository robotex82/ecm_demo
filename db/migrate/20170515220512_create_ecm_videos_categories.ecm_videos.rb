# This migration comes from ecm_videos (originally 20160214022529)
class CreateEcmVideosCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_videos_categories do |t|
      t.string :locale
      t.string :name
      t.text :description

      t.string :markup_language

      # acts_as_list
      t.integer :position

      # friendly_id
      t.string :slug

      # acts_as_published
      t.timestamp :published_at

      t.timestamps null: false
    end
  end
end
