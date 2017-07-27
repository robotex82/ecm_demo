Ecm::Blog::Backend.configure do |config|  
  # Set the resources, that will be shown in the backend menu.
  # 
  # Default: config.registered_controllers = -> {[
  #            Ecm::Blog::Backend::PostsController
  #          ]}
  # 
  config.registered_controllers = -> {[
    Ecm::Blog::Backend::PostsController
  ]}

  # Set the services, that will be shown in the backend menu.
  # 
  # Default: config.registered_services = -> {[
  #          ]}
  # 
  config.registered_services = -> {[
  ]}

  config.creator_label_method = :email
end