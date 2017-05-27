Ecm::TimeTracking::Backend.configure do |config|
  # Set the resources, that will be shown in the backend menu.
  #
  # Default: config.registered_controllers = -> {[
  #            Ecm::TimeTracking::Backend::EntryTypesController,
  #            Ecm::TimeTracking::Backend::EntriesController,
  #            Ecm::TimeTracking::Backend::TrackerCalculationSchemasController
  #          ]}
  #
  config.registered_controllers = lambda {
    [
      Ecm::TimeTracking::Backend::EntryTypesController,
      Ecm::TimeTracking::Backend::EntriesController,
      Ecm::TimeTracking::Backend::TrackerCalculationSchemasController
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

  # Proc that will be used to retrieve the current tracker id.
  # 
  # Default: config.current_tracker_id_proc = -> { current_user.try(:id) }
  # 
  config.current_tracker_id_proc = -> { current_user.try(:id) }
end
