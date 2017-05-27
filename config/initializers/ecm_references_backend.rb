Ecm::References::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::References::Backend::CategoriesController,
  #            Ecm::References::Backend::ReferencesController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::References::Backend::CategoriesController,
      Ecm::References::Backend::ReferencesController
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
