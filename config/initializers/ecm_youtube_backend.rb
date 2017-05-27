Ecm::Youtube::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Youtube::Backend::CategoriesController,
  #            Ecm::Youtube::Backend::VideosController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Youtube::Backend::CategoriesController,
      Ecm::Youtube::Backend::VideosController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[
  #          ]}
  #
  config.registered_services = lambda {
    [
    ]
  }
end
