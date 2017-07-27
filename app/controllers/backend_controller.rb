class BackendController < ApplicationController
  include Controller::RedirectBackConcern
  include Controller::CurrentUserConcern

  helper Ecm::UserAreaHelper

  before_action :authenticate_user!
end
