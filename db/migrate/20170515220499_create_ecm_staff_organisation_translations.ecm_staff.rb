# This migration comes from ecm_staff (originally 6)
class CreateEcmStaffOrganisationTranslations < ActiveRecord::Migration[4.2]
  def up
    Ecm::Staff::Organisation.create_translation_table!({
                                                         name: :string,
                                                         description: :text,
                                                         slug: :string
                                                       }, migrate_data: true)
  end

  def down
    Ecm::Staff::Organisation.drop_translation_table!(migrate_data: true)
  end
end
