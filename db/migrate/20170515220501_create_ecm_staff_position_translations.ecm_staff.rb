# This migration comes from ecm_staff (originally 8)
class CreateEcmStaffPositionTranslations < ActiveRecord::Migration[4.2]
  def up
    Ecm::Staff::Position.create_translation_table!({
                                                     name: :string,
                                                     description: :text,
                                                     slug: :string
                                                   }, migrate_data: true)
  end

  def down
    Ecm::Staff::Position.drop_translation_table!(migrate_data: true)
  end
end
