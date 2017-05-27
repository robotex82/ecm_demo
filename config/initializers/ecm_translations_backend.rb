Ecm::Translations::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Translations::Backend::TranslationsController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Translations::Backend::TranslationsController
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
