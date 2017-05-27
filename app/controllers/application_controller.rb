class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  # From ECM Tags
  helper Ecm::Tags::ApplicationHelper
  
  # From ECM User Area
  include Controller::RedirectBackConcern
  include Controller::CurrentUserConcern

end
