# This migration comes from ecm_staff (originally 20170611221546)
class DropTranslationTableForPositions < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::Position.drop_translation_table!
      end

      dir.down do
        Ecm::Staff::Position.create_translation_table! name: :string, description: :text, slug: :string
      end
    end
  end
end
