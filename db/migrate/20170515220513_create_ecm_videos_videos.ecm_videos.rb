# This migration comes from ecm_videos (originally 20160214022929)
class CreateEcmVideosVideos < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_videos_videos do |t|
      t.integer :category_id
      t.string :name
      t.text :description

      t.string :markup_language

      # acts_as_list
      t.integer :position

      # friendly_id
      t.string :slug

      # acts_as_published
      t.timestamp :published_at

      # paperclip
      t.attachment :clip

      t.timestamps null: false
    end
  end
end
