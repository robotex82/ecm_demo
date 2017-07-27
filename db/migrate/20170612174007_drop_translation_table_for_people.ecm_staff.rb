# This migration comes from ecm_staff (originally 20170611221542)
class DropTranslationTableForPeople < ActiveRecord::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Ecm::Staff::Person.drop_translation_table!
      end

      dir.down do
        Ecm::Staff::Person.create_translation_table! prefix: :string, description: :text, slug: :string
      end
    end
  end
end
