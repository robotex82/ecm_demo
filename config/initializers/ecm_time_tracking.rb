Ecm::TimeTracking.configure do |config|
  # Set the resource class name, that will track time.
  #
  # Default: config.tracker_class_name = 'User'
  #
  config.tracker_class_name = 'Ecm::UserArea::User'

  config.tracker_calculation_schemas = [
    'Ecm::TimeTracking::FlatSumsService',
    'Ecm::TimeTracking::SoftwareDeveloperSumsService'
  ]
end
