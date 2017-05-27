Ecm::Rbac.configure do |config|
  # Set the User class.
  #
  # Default: config.user_class_name = 'User'
  # 
  config.user_class_name = 'User'

  # Set the path of your default permissions file that will be used by
  # Ecm::Rbac::ImportDefaultPermissionsService
  # 
  # default: config.default_permissions_filename = -> { Rails.root.join('config', 'permissions', 'default.yml') }
  # 
  config.default_permissions_filename = -> { Rails.root.join('config', 'permissions', 'default.yml') }
end
