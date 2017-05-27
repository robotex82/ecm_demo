Ecm::Courses::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Courses::Backend::CourseCategoriesController,
  #            Ecm::Courses::Backend::CoursesController,
  #            Ecm::Courses::Backend::CourseDatesController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Courses::Backend::CourseCategoriesController,
      Ecm::Courses::Backend::CoursesController,
      Ecm::Courses::Backend::CourseDatesController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
