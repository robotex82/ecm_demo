# This migration comes from ecm_youtube (originally 20151226161819)
class CreateEcmYoutubeVideos < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_youtube_videos do |t|
      t.integer :category_id, index: true
      t.string :identifier
      t.timestamp :published_at
      t.integer :position

      t.string :title
      t.text :description
      t.integer :duration

      t.timestamps null: false
    end
  end
end
