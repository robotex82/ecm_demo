# This migration comes from ecm_downloads (originally 20170505182738)
class RenameEcmDownloadsDownloadCategoryIdToDownloadCategoryId < ActiveRecord::Migration[4.2]
  def change
    rename_column :ecm_downloads_downloads, :ecm_downloads_download_category_id, :download_category_id
  end
end
