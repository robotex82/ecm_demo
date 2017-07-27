# This migration comes from ecm_references (originally 20170528131209)
class RenameEcmReferencesCategoryIdOnEcmReferencesReferences < ActiveRecord::Migration[4.2]
  def change
    rename_column :ecm_references_references, :ecm_references_category_id, :category_id
  end
end
