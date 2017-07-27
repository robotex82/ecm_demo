require 'rails_helper'

{
  Ecm::Blog::Backend::Engine => {
    Ecm::Blog::Backend::PostsController => {
      sortable_columns: [:title, :body, :creator, :updater, :created_at, :updated_at]
    }
  },

  Ecm::Cms::Backend::Engine => {
    Ecm::Cms::Backend::ContentBoxesController => {
      sortable_columns: [:name]
    },

    Ecm::Cms::Backend::NavigationItemsController => {
      sortable_columns: [:ecm_cms_navigation, :name, :url, :ecm_cms_page, :created_at, :updated_at]
    },

    Ecm::Cms::Backend::NavigationsController => {
      sortable_columns: [:locale, :name, :ecm_cms_navigation_items_count, :created_at, :updated_at]
    },

    Ecm::Cms::Backend::PagesController => {
      sortable_columns: [:title, :pathname, :filename, :home_page?, :layout, :created_at, :updated_at]
    },

    Ecm::Cms::Backend::PartialsController => {
      sortable_columns: [:pathname, :filename, :body, :created_at, :updated_at]
    },

    Ecm::Cms::Backend::TemplatesController => {
      sortable_columns: [:pathname, :filename, :body, :created_at, :updated_at]
    },
  },

  Ecm::Comments::Backend::Engine => {
    Ecm::Comments::Backend::CommentsController => {
      sortable_columns: [:name, :email, :body, :updated_by, :created_by, :created_by_ip_address, :updated_by_ip_address, :created_at, :updated_at]
    }
  },

  Ecm::Courses::Backend::Engine => {
    Ecm::Courses::Backend::CourseCategoriesController => {
      sortable_columns: [:parent, :locale, :name, :description, :created_at, :updated_at]
    },
    Ecm::Courses::Backend::CourseDatesController => {
      sortable_columns: [:course, :description, :start_at, :end_at, :created_at, :updated_at]
    },
    Ecm::Courses::Backend::CoursesController => {
      sortable_columns: [:course_category, :locale, :name, :description, :created_at, :updated_at]
    },
  },

  Ecm::Downloads::Backend::Engine => {
    Ecm::Downloads::Backend::DownloadCategoriesController => { 
      sortable_columns: [:locale, :name, :description, :downloads_count, :parent, :created_at, :updated_at]
    },

    Ecm::Downloads::Backend::DownloadsController => { 
      sortable_columns: [:download_category, :asset_file_size, :asset_content_type, :created_at, :updated_at]
    },
  },

  Ecm::Links::Backend::Engine => {
    Ecm::Links::Backend::CategoriesController => {
      sortable_columns: [:locale, :parent, :name, :short_description, :long_description, :link_footer_column, :links_count, :created_at, :updated_at]
     },

    Ecm::Links::Backend::LinksController => {
      sortable_columns: [:category, :name, :description, :created_at, :updated_at]
    }
  },

  Ecm::News::Backend::Engine => {
    Ecm::News::Backend::ItemsController => {
      sortable_columns: [:locale, :title, :body, :created_at, :updated_at]
    }
  },

  Ecm::Pictures::Backend::Engine => {
    Ecm::Pictures::Backend::GalleriesController => {
      sortable_columns: [:name, :description, :link_images, :pictures_count, :created_at, :updated_at]
    },

    Ecm::Pictures::Backend::PicturesController  => {
      sortable_columns: [:gallery, :name, :description, :image_file_size, :created_at, :updated_at]
    },
  },

  Ecm::Rbac::Backend::Engine => {
    Ecm::Rbac::Backend::PermissionsController => {
      sortable_columns: [:identifier, :enabled?, :enabled_from, :enabled_to, :created_at, :updated_at]
    },

    Ecm::Rbac::Backend::RolesController => {
      sortable_columns: [:identifier, :enabled?, :enabled_from, :enabled_to, :created_at, :updated_at]
    },

    Ecm::Rbac::Backend::UsersController => {
      sortable_columns: [:email, :roles_count, :enabled_roles_count, :permissions_count, :enabled_permissions_count, :created_at, :updated_at]
    },
  },

  Ecm::References::Backend::Engine => {
    Ecm::References::Backend::CategoriesController => {
      sortable_columns: [:parent, :locale, :name, :description, :references_count, :created_at, :updated_at]
    },

    Ecm::References::Backend::ReferencesController => {
      sortable_columns: [:category, :name, :description, :created_at, :updated_at]
    },
  },

  Ecm::Staff::Backend::Engine => {
    Ecm::Staff::Backend::BusinessUnitsController => {
      sortable_columns: [:organisation, :parent, :name, :description, :created_at, :updated_at]
    },
    Ecm::Staff::Backend::OrganisationsController => {
      sortable_columns: []
    },
    Ecm::Staff::Backend::PeopleController => {
      sortable_columns: []
    },
    Ecm::Staff::Backend::PositionsController => {
      sortable_columns: []
    },
  },

  Ecm::Tags::Backend::Engine => {
    Ecm::Tags::Backend::TaggingsController => {
      sortable_columns: []
    },

    Ecm::Tags::Backend::TagsController => {
      sortable_columns: []
    },
  },

  Ecm::TimeTracking::Backend::Engine => {
    Ecm::TimeTracking::Backend::EntriesController => {
      sortable_columns: []
    },

    Ecm::TimeTracking::Backend::EntryTypesController => {
      sortable_columns: []
    },

    Ecm::TimeTracking::Backend::TrackerCalculationSchemasController => {
      sortable_columns: []
    },
  },

  Ecm::Translations::Backend::Engine => {
    Ecm::Translations::Backend::TranslationsController => {
      sortable_columns: []
    },
  },

  Ecm::UserArea::Backend::Engine => {
    Ecm::UserArea::Backend::UsersController => {
      sortable_columns: []
    },
  },

  Ecm::Videos::Backend::Engine => {
    Ecm::Videos::Backend::CategoriesController => {
      sortable_columns: [:locale, :name, :videos_count, :description, :created_at, :updated_at]
    },
    Ecm::Videos::Backend::VideosController => {
      sortable_columns: [:category, :name, :description, :created_at, :updated_at]
    },
  },

  Ecm::Youtube::Backend::Engine => {
    Ecm::Youtube::Backend::CategoriesController => {
      sortable_columns: [:identifier, :translated_identifier, :created_at, :updated_at]
    },

    Ecm::Youtube::Backend::VideosController => {
      sortable_columns: [:category, :title, :description, :duration, :identifier, :created_at, :updated_at]
    },
  }
}.each do |engine, controllers|
  I18n.available_locales.each do |locale|
    RSpec.describe engine.name, type: :feature do
      describe locale do
        before(:each) { I18n.locale = locale }

        let(:engine_route_name) { I18n.t("routes.#{engine.name.underscore.dasherize.gsub('/', '-')}") }
        let(:engine_path) { "/#{locale}/backend/#{engine_route_name}" }

        let(:user) { create(:ecm_user_area_user, :authenticable) }

        controllers.each do |controller, options|
          next unless options.has_key?(:sortable_columns) && options[:sortable_columns].any?
          describe controller.name do
            let(:resource_class) { controller.resource_class }
            let(:factory_name)   { resource_class.name.underscore.gsub('/', '_') }
            let(:base_path)      { "#{engine_path}/#{controller.resource_class.name.demodulize.underscore.pluralize}" }

            describe 'list' do
              before(:each) do
                sign_in(user)
                visit(base_path)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(base_path) }
            end

            describe 'sortable columns' do
              before(:each) do
                sign_in(user)
                visit(base_path)
              end

              options[:sortable_columns].each do |column|
                it { expect(page.body).to have_link(resource_class.human_attribute_name(column)) }
              end
            end
          end
        end
      end
    end
  end
end if Itsf::Backend.features?(:ransack)
