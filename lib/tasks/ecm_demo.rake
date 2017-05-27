namespace :ecm_demo do
  task install_ecm_modules: [:environment] do
    ADMIN_MODULE = "Itsf::Backend"

    FRONTEND_MODULES = %w[
      Ecm::Blog
      Ecm::Calendar::Helper
      Ecm::Cms
      Ecm::Comments
      Ecm::Contact
      Ecm::Courses
      Ecm::Downloads
      Ecm::Lightbox
      Ecm::Links
      Ecm::News
      Ecm::Pictures
      Ecm::Rbac
      Ecm::References
      Ecm::Sliders
      Ecm::Staff
      Ecm::Tags
      Ecm::TimeTracking
      Ecm::Translations
      Ecm::UserArea
      Ecm::Videos
      Ecm::Youtube
    ]

    BACKEND_MODULES = %w[
      Ecm::Blog::Backend
      Ecm::Cms::Backend
      Ecm::Comments::Backend
      Ecm::CoreInfo::Backend
      Ecm::Courses::Backend
      Ecm::Downloads::Backend
      Ecm::Links::Backend
      Ecm::News::Backend
      Ecm::Pictures::Backend
      Ecm::Rbac::Backend
      Ecm::References::Backend
      Ecm::Staff::Backend
      Ecm::Tags::Backend
      Ecm::TimeTracking::Backend
      Ecm::Translations::Backend
      Ecm::UserArea::Backend
      Ecm::Videos::Backend
      Ecm::Youtube::Backend
    ]

    MODULES_WITHOUT_MIGRATIONS = %w[
      Ecm::Calendar::Helper
      Ecm::Contact
      Ecm::Lightbox
    ]

    ALL_MODULES = [ADMIN_MODULE] + FRONTEND_MODULES + BACKEND_MODULES

    puts "Installing #{ALL_MODULES.size} modules..."

    ALL_MODULES.each do |module_name|
      puts module_name
      Rails::Generators.invoke("#{module_name.underscore.gsub("/", ":")}:install")
      puts " -> Done"
    end

    puts "Installing migrations for #{FRONTEND_MODULES.size} modules..."

    (FRONTEND_MODULES - MODULES_WITHOUT_MIGRATIONS).each do |module_name|
      puts module_name
      Rake::Task["#{module_name.underscore.gsub("/", "_")}:install:migrations"].execute
      Rake::Task["railties:install:migrations"].reenable
      puts " -> Done"
    end

    puts 'Migrating'
    Rake::Task["db:migrate"].invoke
    puts " -> Done"

    puts 'Adding localized homepages'
    Rake::Task["ecm:cms:add_homepages"].invoke
    puts " -> Done"
  end
end
