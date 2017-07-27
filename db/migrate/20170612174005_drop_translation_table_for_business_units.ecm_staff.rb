# This migration comes from ecm_staff (originally 20170611221519)
class DropTranslationTableForBusinessUnits < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::BusinessUnit.drop_translation_table!
      end

      dir.down do
        Ecm::Staff::BusinessUnit.create_translation_table! name: :string, description: :text, slug: :string
      end
    end
  end
end
