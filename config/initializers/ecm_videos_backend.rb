Ecm::Videos::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
  # 
  # Default: config.registered_controllers = -> {[
  #            Ecm::Videos::Backend::CategoriesController,
  #            Ecm::Videos::Backend::VideosController
  #          ]}
  # 
  config.registered_controllers = -> {[
    Ecm::Videos::Backend::CategoriesController,
    Ecm::Videos::Backend::VideosController
  ]}

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.registered_services = -> {[
  #          ]}
  # 
  config.registered_services = -> {[
  ]}
end