Ecm::News::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::News::Backend::ItemsController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::News::Backend::ItemsController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
