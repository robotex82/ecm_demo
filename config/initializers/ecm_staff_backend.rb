Ecm::Staff::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::Staff::Backend::OrganisationsController,
  #            Ecm::Staff::Backend::BusinessUnitsController,
  #            Ecm::Staff::Backend::PositionsController,
  #            Ecm::Staff::Backend::PeopleController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::Staff::Backend::OrganisationsController,
      Ecm::Staff::Backend::BusinessUnitsController,
      Ecm::Staff::Backend::PositionsController,
      Ecm::Staff::Backend::PeopleController
    ]
  }

  # Set the services, that will be shown in the backend menu.
  #
  # Default: config.registered_services = -> {[]}
  #
  config.registered_services = -> { [] }
end
