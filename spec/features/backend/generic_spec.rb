require 'rails_helper'

DEFAULT_ACTIONS = [:index, :new, :create, :edit, :update, :delete]

{
  # Ecm::Blog::Backend::Engine => {
  #   Ecm::Blog::Backend::PostsController => {
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { body: 'This is an updated blog post!' },
  #     before_create: ->(spec) { attributes.merge!(created_by_id: create(:user).send(Ecm::Blog::Backend.creator_label_method)) }
  #   }
  # },

  Ecm::Cms::Backend::Engine => {
    # Ecm::Cms::Backend::ContentBoxesController => {
    #   actions: DEFAULT_ACTIONS,
    #   create_attributes: Proc.new { 
    #     attributes = attributes_for(:ecm_cms_content_box)
    #     fill_in 'content_box[name]', with: attributes[:name]
    #   },
    #   update_attributes: Proc.new { 
    #     fill_in 'content_box[name]', with: 'New name'
    #   },
    # },

    Ecm::Cms::Backend::NavigationItemsController => {
      actions: DEFAULT_ACTIONS,
      before_create: ->(spec) { attributes.merge!(ecm_cms_navigation_id: create(:ecm_cms_navigation).name) },

      create_form: Proc.new { 
        select attributes[:ecm_cms_navigation_id], from: 'navigation_item[ecm_cms_navigation_id]'
        fill_in 'navigation_item[name]', with: attributes[:name]
        fill_in 'navigation_item[url]', with: attributes[:url]
        fill_in 'navigation_item[key]', with: attributes[:key]
      },
      update_form: Proc.new { 
        fill_in 'navigation_item[name]', with: 'New name'
      },
    },

    Ecm::Cms::Backend::NavigationsController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        select 'de', from: 'navigation[locale]'
        fill_in 'navigation[name]', with: attributes[:name]
      },
      update_form: Proc.new { 
        fill_in 'navigation[name]', with: 'New name'
      },
    },

    Ecm::Cms::Backend::PagesController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'page[title]',    with: attributes[:title]
        fill_in 'page[pathname]', with: attributes[:pathname]
        fill_in 'page[basename]', with: attributes[:basename]
      },
      update_form: Proc.new { 
        fill_in 'page[title]', with: 'New title'
      },
    },

    Ecm::Cms::Backend::PartialsController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'partial[pathname]', with: attributes[:pathname]
        fill_in 'partial[basename]', with: attributes[:basename]
      },
      update_form: Proc.new { 
        fill_in 'partial[basename]',  with: 'new_name'
      },
    },

    Ecm::Cms::Backend::TemplatesController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'template[pathname]', with: attributes[:pathname]
        fill_in 'template[basename]', with: attributes[:basename]
      },
      update_form: Proc.new { 
        fill_in 'template[basename]', with: 'new_name'
      },
    },
  },

  # Ecm::Comments::Backend::Engine => {
  #   Ecm::Comments::Backend::CommentsController => {
  #     actions: DEFAULT_ACTIONS,
  #     create_attributes: [:commntable_type, :commentable_id, :name, :homepage, :email, :body],
  #     update_attributes: { body: 'This is an updated comment!' },
  #     before_create: ->(spec) { attributes.merge!(commentable_type: 'Post', commentable_id: create(:post).id) }
  #   }
  # },

  Ecm::Courses::Backend::Engine => {
    Ecm::Courses::Backend::CourseCategoriesController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        select attributes[:locale], from: 'course_category[locale]'
        fill_in 'course_category[name]', with: attributes[:name]
      },
      update_form: Proc.new { 
        fill_in 'course_category[name]', with: 'new_name'
      },
    },
    Ecm::Courses::Backend::CourseDatesController => {
      actions: DEFAULT_ACTIONS,
      before_create: ->(spec) { attributes.merge!(course_id: create(:ecm_courses_course).name) },
      create_form: Proc.new { 
        select attributes[:course_id], from: 'course_date[course_id]'
        select_date_and_time attributes[:start_at],  from: 'course_date_start_at'
        select_date_and_time attributes[:end_at],    from: 'course_date_end_at'
      },
      update_form: Proc.new { 
        select_date_and_time (record.start_at + 2.hours), from: 'course_date_end_at'
      },
    },
    Ecm::Courses::Backend::CoursesController => {
      actions: DEFAULT_ACTIONS,
      before_create: ->(spec) { attributes.merge!(course_category_id: create(:ecm_courses_course_category).name) },
      create_form: Proc.new { 
        select attributes[:course_category_id], from: 'course[course_category_id]'
        fill_in 'course[name]', with: attributes[:name]
      },
      update_form: Proc.new { 
        fill_in 'course[name]', with: 'new_name'
      },
    },
  },

  # Ecm::Downloads::Backend::Engine => {
  #   # works
  #   Ecm::Downloads::Backend::DownloadCategoriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-download-category-name' }
  #   },

  #   Ecm::Downloads::Backend::DownloadsController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-download-name' },
  #     before_create: ->(spec) { attributes.merge!(download_category_id: create(:ecm_downloads_download_category).name) }
  #   },
  # },

  Ecm::Links::Backend::Engine => {
    Ecm::Links::Backend::CategoriesController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'category[name]', with: attributes[:name]
        select attributes[:markup_language], from: 'category[markup_language]'
        select attributes[:locale],          from: 'category[locale]'
      },
      update_form: Proc.new { 
        fill_in 'category[name]', with: 'New category name'
      },
     },

    Ecm::Links::Backend::LinksController => {
      actions: DEFAULT_ACTIONS,
      # before_create: ->(spec) { attributes.merge!(category_id: create(:ecm_links_category).name) },
      create_form: Proc.new { 
        fill_in 'link[name]',            with: attributes[:name]
        fill_in 'link[url]',             with: attributes[:url]
        select attributes[:markup_language], from: 'link[markup_language]'
      },
      update_form: Proc.new { 
        fill_in 'link[url]', with: 'https://www.new-domain.com'
      },
    }
  },

  Ecm::News::Backend::Engine => {
    Ecm::News::Backend::ItemsController => {
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'item[title]',        with: 'News title'
        choose 'de'
        fill_in 'item[body]',         with: 'Lorem ipsum'
        check 'item[link_to_more]'
        check 'item[published]'
      },
      update_form: Proc.new { 
        fill_in 'item[title]', with: 'new-title'
        fill_in 'item[body]',  with: 'new-body'
      },
    }
  },

  # Ecm::Pictures::Backend::Engine => {
  #   Ecm::Pictures::Backend::GalleriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-gallery-name' }
  #   },

  #   Ecm::Pictures::Backend::PicturesController  => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-picture-name' },
  #     before_create: ->(spec) { attributes.merge!(gallery_id: create(:ecm_pictures_gallery).name) }
  #   },
  # },

  # Ecm::Rbac::Backend::Engine => {
  #   Ecm::Rbac::Backend::PermissionsController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'new-permission-identifier' }
  #   },

  #   Ecm::Rbac::Backend::RolesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'new-role-identifier' }
  #   },

  #   Ecm::Rbac::Backend::UsersController => {
  #     actions: DEFAULT_ACTIONS - [:new, :create, :edit, :update, :delete]
  #   },
  # },

  # Ecm::References::Backend::Engine => {
  #   Ecm::References::Backend::CategoriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-category-name' }
  #   },

  #   Ecm::References::Backend::ReferencesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-reference-name' },
  #     before_create: ->(spec) { attributes.merge!(category_id: create(:ecm_references_category).name) }
  #   },
  # },

  Ecm::Staff::Backend::Engine => {
    Ecm::Staff::Backend::BusinessUnitsController => { 
      actions: DEFAULT_ACTIONS,
      before_create: ->(spec) { attributes.merge!(organisation_id: create(:ecm_staff_organisation).name) },
      create_form: Proc.new { 
        select attributes[:organisation_id], from: 'business_unit[organisation_id]'
        fill_in 'business_unit[name]',            with: attributes[:name]
        fill_in 'business_unit[description]',     with: attributes[:description]
        select attributes[:markup_language], from: 'business_unit[markup_language]'
      },
      update_form: Proc.new { 
        fill_in 'business_unit[name]',        with: 'New business unit name'
      },
    },

    Ecm::Staff::Backend::OrganisationsController => { 
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'organisation[name]',            with: attributes[:name]
        # fill_in 'organisation[description]',     with: attributes[:description]
        # fill_in 'organisation[markup_language]', with: attributes[:markup_language]
      },
      update_form: Proc.new { 
        fill_in 'organisation[name]',        with: 'New organsiation unit name'
      },
    },

    Ecm::Staff::Backend::PeopleController => { 
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'person[prefix]',          with: attributes[:prefix]
        fill_in 'person[firstname]',       with: attributes[:firstname]
        fill_in 'person[lastname]',        with: attributes[:lastname]
        select attributes[:markup_language], from: 'person[markup_language]'
      },
      update_form: Proc.new { 
        fill_in 'person[firstname]',       with: 'Jane'
      },
    },
    
    Ecm::Staff::Backend::PositionsController => { 
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'position[name]',       with: attributes[:name]
      },
      update_form: Proc.new { 
        fill_in 'position[name]',       with: 'New position name'
      },
    },
  },

  # Ecm::Tags::Backend::Engine => {
  #   Ecm::Tags::Backend::TaggingsController => { 
  #     actions: DEFAULT_ACTIONS,
  #     before_update: ->(spec) { create(:ecm_tags_tag, name: 'new-tag') },
  #     update_attributes: { tag_id: 'new-tag' },
  #     before_create: ->(spec) { attributes.merge!(tag_id: create(:ecm_tags_tag).name) },
  #   },

  #   Ecm::Tags::Backend::TagsController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-tag-name' }
  #   },
  # },

  # Ecm::TimeTracking::Backend::Engine => {
  #   Ecm::TimeTracking::Backend::EntriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { description: 'new-entry-description' },
  #     before_create: ->(spec) { attributes.merge!(entry_type_id: create(:ecm_time_tracking_entry_type).identifier) },
  #     factory: ->(spec) { create(:ecm_time_tracking_entry, tracker: user) }
  #   },

  #   Ecm::TimeTracking::Backend::EntryTypesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'new-identifier' }
  #   },

  #   Ecm::TimeTracking::Backend::TrackerCalculationSchemasController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'Ecm::TimeTracking::SoftwareDeveloperSumsService' },
  #     before_create: ->(spec) { attributes.merge!(tracker_id: create(:user).human) }
  #   },
  # },

  # Ecm::Translations::Backend::Engine => {
  #   Ecm::Translations::Backend::TranslationsController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { key: 'value' }
  #   },
  # },

  Ecm::UserArea::Backend::Engine => {
    Ecm::UserArea::Backend::UsersController => { 
      actions: DEFAULT_ACTIONS,
      create_form: Proc.new { 
        fill_in 'user[email]', with: 'email@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      },
      update_form: Proc.new { 
        fill_in 'user[email]', with: 'new-email@example.com'
      },
    },
  },

  # Ecm::Videos::Backend::Engine => {
  #   Ecm::Videos::Backend::CategoriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-category-name' }
  #   },
  #   Ecm::Videos::Backend::VideosController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { name: 'new-video-name' },
  #     before_create: ->(spec) { attributes.merge!(category_id: create(:ecm_videos_category).name) }
  #   },
  # },

  # Ecm::Youtube::Backend::Engine => {
  #   Ecm::Youtube::Backend::CategoriesController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'new-identifier' }
  #   },

  #   Ecm::Youtube::Backend::VideosController => { 
  #     actions: DEFAULT_ACTIONS,
  #     update_attributes: { identifier: 'new-identifier' },
  #     before_create: ->(spec) { attributes.merge!(category_id: create(:ecm_youtube_category).identifier) }
  #   },
  # }
}.each do |engine, controllers|
  # [I18n.default_locale].each do |locale|
  I18n.available_locales.each do |locale|
    RSpec.describe engine.name, type: :feature do
      describe locale do
        before(:each) { I18n.locale = locale }

        let(:engine_route_name) { I18n.t("routes.#{engine.name.underscore.dasherize.gsub('/', '-')}") }
        let(:engine_path) { "/#{locale}/backend/#{engine_route_name}" }

        let(:user) { create(:ecm_user_area_user, :authenticable) }

        describe 'dashboard access' do
          let(:dashboard_path) { engine_path }

          before(:each) do
            sign_in(user)
            visit(dashboard_path)
          end

          it { expect(page.status_code).to eq(200) }
          it { expect(current_path).to eq(dashboard_path) }
        end

        controllers.each do |controller, options|

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
            end if options[:actions].include?(:index)

            describe 'list with record' do
              if options[:factory].respond_to?(:call)
                let(:record) { instance_eval(&options[:factory])  }
              else
                let(:record) { create(factory_name) }
              end
              
              before(:each) do
                sign_in(user)
                record
                visit(base_path)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(base_path) }
            end if options[:actions].include?(:index)

            describe 'new' do
              let(:new_path)           { "#{base_path}/new" }
              let(:submit_button_text) { I18n.t('helpers.submit.create', model: resource_class.model_name.human) }

              before(:each) do
                sign_in(user)
                visit(new_path)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(new_path) }
              it { expect(page.body).to have_xpath("//input[@type='submit' and @value='#{submit_button_text}']") }
            end if options[:actions].include?(:new)

            describe 'create' do
              let(:new_path)           { "#{base_path}/new" }
              let(:attributes)         { attributes_for(factory_name) }
              let(:form)               { options[:create_form] }
              let(:form_name)          { controller.resource_class.name.demodulize.underscore  }
              let(:show_path)          { "#{base_path}/#{controller.resource_class.last.to_param}" }
              let(:submit_button_text) { I18n.t('helpers.submit.create', model: resource_class.model_name.human) }
              let(:submit_button)      { find(:xpath, "//input[@type='submit' and @value='#{submit_button_text}']") }
              let(:success_message)    { I18n.t('flash.actions.create.notice', resource_name: resource_class.model_name.human) }
              let(:before_create_count) { controller.resource_class.count }

            before(:each) do
              sign_in(user)
              before_create_count
              instance_eval(&options[:before_create]) if options[:before_create].respond_to?(:call)
              visit(new_path)
              instance_eval &form
              submit_button.click
            end

            it { expect(page.status_code).to eq(200) }
            it { expect(current_path).to eq(show_path) }
            it { expect(page.body).to have_text(success_message) }
            it { expect(controller.resource_class.count).to eq(before_create_count + 1) }
            end if options[:actions].include?(:create)

            describe 'show' do
              if options[:factory].respond_to?(:call)
                let(:record) { instance_eval(&options[:factory])  }
              else
                let(:record) { create(factory_name) }
              end
              let(:show_path) { "#{base_path}/#{record.to_param}" }

              before(:each) do
                record
                sign_in(user)
                visit(show_path)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(show_path) }
            end if options[:actions].include?(:show)

            describe 'edit' do
              if options[:factory].respond_to?(:call)
                let(:record) { instance_eval(&options[:factory])  }
              else
                let(:record) { create(factory_name) }
              end
              let(:edit_path) { "#{base_path}/#{record.to_param}/edit" }

              before(:each) do
                record
                sign_in(user)
                visit(edit_path)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(edit_path) }
            end if options[:actions].include?(:edit)

            describe 'update' do
              if options[:factory].respond_to?(:call)
                let(:record) { instance_eval(&options[:factory])  }
              else
                let(:record) { create(factory_name) }
              end
              let(:show_path)   { "#{base_path}/#{record.to_param}" }
              let(:edit_path)   { "#{show_path}/edit" }
              # let(:attributes)  { options[:update_attributes] }

              let(:form)               { options[:update_form]  }
              let(:form_name)          { controller.resource_class.name.demodulize.underscore  }
              let(:submit_button_text) { I18n.t('helpers.submit.update', model: resource_class.model_name.human) }
              let(:submit_button)      { find(:xpath, "//input[@type='submit' and @value='#{submit_button_text}']") }
              let(:success_message)    { I18n.t('flash.actions.update.notice', resource_name: resource_class.model_name.human) }

              describe 'ui' do
                before(:each) do
                  instance_eval(&options[:before_update]) if options[:before_update].respond_to?(:call)
                  sign_in(user)
                  visit(edit_path)
                  instance_eval &form
                  submit_button.click
                end

                it { expect(page.status_code).to eq(200) }
                it { expect(current_path).to eq(show_path) }
                it { expect(page.body).to have_text(success_message) }
              end

              describe 'persistence changes' do
                before(:each) do
                  instance_eval(&options[:before_update]) if options[:before_update].respond_to?(:call)
                  sign_in(user)
                  visit(edit_path)
                  instance_eval &form
                  submit_button.click                
                  record.reload
                end

                # options[:update_attributes].each do |key, value|
                #   it { expect(resource_class.last.send(key)).to eq(value) }
                # end
              end
            end if options[:actions].include?(:update)

            describe 'delete' do
              if options[:factory].respond_to?(:call)
                let(:record) { instance_eval(&options[:factory])  }
              else
                let(:record) { create(factory_name) }
              end
              let(:show_path)          { "#{base_path}/#{record.to_param}" }
              let(:delete_button_text) { I18n.t('itsf.backend.resource.base.show.destroy') }

              before(:each) do
                record
                sign_in(user)
                visit(show_path)
                click_link(delete_button_text)
              end

              it { expect(page.status_code).to eq(200) }
              it { expect(current_path).to eq(base_path) }
            end if options[:actions].include?(:delete)
          end
        end
      end
    end
  end
end
