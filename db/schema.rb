# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170515220515) do

  create_table "ecm_blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "published_at"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_cms_content_boxes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_cms_folders", force: :cascade do |t|
    t.string "basename"
    t.string "pathname"
    t.integer "children_count", default: 0, null: false
    t.integer "ecm_cms_templates_count", default: 0, null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_id"], name: "index_ecm_cms_folders_on_parent_id"
  end

  create_table "ecm_cms_navigation_items", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "key"
    t.string "options"
    t.text "properties"
    t.integer "ecm_cms_navigation_id"
    t.integer "ecm_cms_page_id"
    t.integer "parent_id"
    t.integer "children_count", default: 0, null: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_cms_navigation_id"], name: "index_ecm_cms_navigation_items_on_ecm_cms_navigation_id"
    t.index ["parent_id"], name: "index_ecm_cms_navigation_items_on_parent_id"
  end

  create_table "ecm_cms_navigations", force: :cascade do |t|
    t.string "locale"
    t.string "name"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_cms_page_content_blocks", force: :cascade do |t|
    t.text "body"
    t.integer "ecm_cms_page_id"
    t.integer "ecm_cms_content_box_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_cms_content_box_id"], name: "index_ecm_cms_page_content_blocks_on_ecm_cms_content_box_id"
    t.index ["ecm_cms_page_id"], name: "index_ecm_cms_page_content_blocks_on_ecm_cms_page_id"
  end

  create_table "ecm_cms_pages", force: :cascade do |t|
    t.string "basename"
    t.string "pathname"
    t.string "title"
    t.text "meta_description"
    t.text "body"
    t.string "layout"
    t.string "locale"
    t.string "format"
    t.string "handler"
    t.integer "ecm_cms_folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_cms_folder_id"], name: "index_ecm_cms_pages_on_ecm_cms_folder_id"
  end

  create_table "ecm_cms_partials", force: :cascade do |t|
    t.string "basename"
    t.string "pathname"
    t.text "body"
    t.string "layout"
    t.string "locale"
    t.string "format"
    t.string "handler"
    t.integer "ecm_cms_folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_cms_folder_id"], name: "index_ecm_cms_partials_on_ecm_cms_folder_id"
  end

  create_table "ecm_cms_templates", force: :cascade do |t|
    t.string "basename"
    t.string "pathname"
    t.text "body"
    t.string "locale"
    t.string "format"
    t.string "handler"
    t.integer "ecm_cms_folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_cms_folder_id"], name: "index_ecm_cms_templates_on_ecm_cms_folder_id"
  end

  create_table "ecm_comments_comments", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.string "name"
    t.string "homepage"
    t.string "email"
    t.text "body"
    t.integer "created_by_id"
    t.string "created_by_ip_address"
    t.integer "updated_by_id"
    t.string "updated_by_ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_courses_course_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "locale"
    t.integer "position"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_courses_course_dates", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "description"
    t.integer "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_courses_courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "locale"
    t.integer "course_category_id"
    t.integer "position"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_category_id"], name: "index_ecm_courses_courses_on_course_category_id"
  end

  create_table "ecm_downloads_download_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "locale"
    t.integer "position"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_downloads_downloads", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "published_at"
    t.integer "download_category_id"
    t.integer "position"
    t.string "slug"
    t.string "asset_file_name"
    t.integer "asset_file_size"
    t.string "asset_content_type"
    t.datetime "asset_updated_at"
    t.string "asset_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["download_category_id"], name: "index_ecm_downloads_downloads_on_download_category_id"
  end

  create_table "ecm_links_categories", force: :cascade do |t|
    t.string "locale"
    t.string "name"
    t.text "short_description"
    t.text "long_description"
    t.string "markup_language"
    t.integer "link_footer_column"
    t.integer "ecm_links_links_count", default: 0, null: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "parent_id"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_links_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.text "description"
    t.string "markup_language"
    t.integer "ecm_links_category_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ecm_links_category_id"], name: "index_ecm_links_links_on_ecm_links_category_id"
  end

  create_table "ecm_news_items", force: :cascade do |t|
    t.string "title"
    t.string "locale"
    t.text "body"
    t.datetime "published_at"
    t.boolean "link_to_more"
    t.string "markup_language"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_pictures_attached_pictures", force: :cascade do |t|
    t.integer "ecm_pictures_picture_id"
    t.string "pictureable_type"
    t.integer "pictureable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_pictures_galleries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "link_images"
    t.integer "pictures_count", default: 0, null: false
    t.integer "position"
    t.string "markup_language"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_pictures_pictures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "gallery_id"
    t.integer "position"
    t.string "markup_language"
    t.string "slug"
    t.string "image_file_name"
    t.integer "image_file_size"
    t.string "image_content_type"
    t.datetime "image_updated_at"
    t.string "image_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_rbac_permissions", force: :cascade do |t|
    t.string "identifier"
    t.datetime "enabled_from"
    t.datetime "enabled_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_rbac_role_permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_ecm_rbac_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_ecm_rbac_role_permissions_on_role_id"
  end

  create_table "ecm_rbac_roles", force: :cascade do |t|
    t.string "identifier"
    t.datetime "enabled_from"
    t.datetime "enabled_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_rbac_user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_ecm_rbac_user_roles_on_role_id"
    t.index ["user_id"], name: "index_ecm_rbac_user_roles_on_user_id"
  end

  create_table "ecm_references_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "locale"
    t.string "markup_language"
    t.integer "lft"
    t.integer "rgt"
    t.integer "parent_id"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_id"], name: "index_ecm_references_categories_on_parent_id"
  end

  create_table "ecm_references_references", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "position"
    t.string "markup_language"
    t.datetime "published_at"
    t.string "slug"
    t.integer "ecm_references_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_sliders_items", force: :cascade do |t|
    t.text "body"
    t.string "url"
    t.integer "position"
    t.string "markup_language"
    t.integer "ecm_sliders_slider_id"
    t.string "image_file_name"
    t.integer "image_file_size"
    t.string "image_content_type"
    t.datetime "image_updated_at"
    t.string "image_fingerprint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_sliders_sliders", force: :cascade do |t|
    t.string "locale"
    t.string "name"
    t.text "description"
    t.boolean "auto_start"
    t.decimal "interval", precision: 8, scale: 2
    t.string "slug"
    t.integer "ecm_sliders_items_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_staff_business_unit_translations", force: :cascade do |t|
    t.integer "business_unit_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "slug"
    t.index ["business_unit_id"], name: "index_cc00704703780d8b9055f73177cca693f3a1d0ed"
    t.index ["locale"], name: "index_ecm_staff_business_unit_translations_on_locale"
  end

  create_table "ecm_staff_business_units", force: :cascade do |t|
    t.integer "organisation_id"
    t.string "name"
    t.text "description"
    t.string "markup_language"
    t.string "slug"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["organisation_id"], name: "index_ecm_staff_business_units_on_organisation_id"
    t.index ["parent_id"], name: "index_ecm_staff_business_units_on_parent_id"
  end

  create_table "ecm_staff_organisation_translations", force: :cascade do |t|
    t.integer "organisation_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "slug"
    t.index ["locale"], name: "index_ecm_staff_organisation_translations_on_locale"
    t.index ["organisation_id"], name: "index_ec7eecd88462db07cbe6bb6d0465dff84bb8b9db"
  end

  create_table "ecm_staff_organisations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "markup_language"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_staff_people", force: :cascade do |t|
    t.string "prefix"
    t.string "firstname"
    t.string "lastname"
    t.date "birthdate"
    t.text "description"
    t.integer "position"
    t.string "markup_language"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecm_staff_person_positions", force: :cascade do |t|
    t.integer "person_id"
    t.integer "business_unit_id"
    t.integer "position_id"
    t.date "begin_at"
    t.date "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["business_unit_id"], name: "index_ecm_staff_person_positions_on_business_unit_id"
    t.index ["person_id"], name: "index_ecm_staff_person_positions_on_person_id"
    t.index ["position_id"], name: "index_ecm_staff_person_positions_on_position_id"
  end

  create_table "ecm_staff_person_translations", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefix"
    t.text "description"
    t.string "slug"
    t.index ["locale"], name: "index_ecm_staff_person_translations_on_locale"
    t.index ["person_id"], name: "index_ecm_staff_person_translations_on_ecm_staff_person_id"
  end

  create_table "ecm_staff_position_translations", force: :cascade do |t|
    t.integer "position_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "slug"
    t.index ["locale"], name: "index_ecm_staff_position_translations_on_locale"
    t.index ["position_id"], name: "index_ecm_staff_position_translations_on_ecm_staff_position_id"
  end

  create_table "ecm_staff_positions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "markup_language"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_id"], name: "index_ecm_staff_positions_on_parent_id"
  end

  create_table "ecm_tags_taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "ecm_tags_tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.string "color"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "ecm_time_tracking_entries", force: :cascade do |t|
    t.integer "tracker_id"
    t.integer "entry_type_id"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.integer "break_length_in_seconds"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_time_tracking_entry_types", force: :cascade do |t|
    t.string "identifier"
    t.integer "due_in_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_time_tracking_tracker_calculation_schemas", force: :cascade do |t|
    t.integer "tracker_id"
    t.string "identifier"
    t.datetime "enabled_from"
    t.datetime "enabled_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_translations_translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["locale", "key"], name: "index_ecm_translations_translations_on_locale_and_key", unique: true
  end

  create_table "ecm_user_area_users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "single_access_token"
    t.string "perishable_token"
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.boolean "active", default: false
    t.boolean "approved", default: false
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_videos_categories", force: :cascade do |t|
    t.string "locale"
    t.string "name"
    t.text "description"
    t.string "markup_language"
    t.integer "position"
    t.string "slug"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_videos_videos", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.text "description"
    t.string "markup_language"
    t.integer "position"
    t.string "slug"
    t.datetime "published_at"
    t.string "clip_file_name"
    t.string "clip_content_type"
    t.integer "clip_file_size"
    t.datetime "clip_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_youtube_categories", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecm_youtube_videos", force: :cascade do |t|
    t.integer "category_id"
    t.string "identifier"
    t.datetime "published_at"
    t.integer "position"
    t.string "title"
    t.text "description"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_ecm_youtube_videos_on_category_id"
  end

end
