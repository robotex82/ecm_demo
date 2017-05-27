# This migration comes from ecm_news (originally 1)
class CreateEcmNewsItems < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_news_items do |t|
      t.string :title
      t.string :locale
      t.text :body
      t.timestamp :published_at
      t.boolean :link_to_more

      # acts as markup
      t.string :markup_language

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
