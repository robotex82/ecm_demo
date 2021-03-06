# This migration comes from ecm_links (originally 1)
class CreateEcmLinksCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_links_categories do |t|
      t.string :locale
      t.string :name
      t.text :short_description
      t.text :long_description
      t.string :markup_language
      t.integer :link_footer_column

      # associations
      t.integer :ecm_links_links_count, default: 0, null: false

      # awesome nested set
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id
      t.integer :depth

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
