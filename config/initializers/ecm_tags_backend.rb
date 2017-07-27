Ecm::Tags::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Tags::Backend::TagsController
  # ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Tags::Backend::TagsController,
      Ecm::Tags::Backend::TaggingsController
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

  config.taggable_class_names = %w(
    Ecm::Pictures::Picture
    Ecm::News::Item
  )

  config.tagger_class_names = %w(
    User
  )
end
