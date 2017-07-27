class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  # From ECM Tags
  helper Ecm::Tags::ApplicationHelper
  
  # From ECM User Area
  include Controller::RedirectBackConcern
  include Controller::CurrentUserConcern

  module LocalizedEngines
    extend ActiveSupport::Concern

    ENGINES = [Ecm::Cms::Engine]

    included do
      ENGINES.each do |engine|
        puts "Adding helper method #{engine.engine_name}"
        helper_method engine.engine_name
      end
    end

    private

    ENGINES.each do |engine|
      puts "Defining method #{engine.engine_name}"
      define_method engine.engine_name do
        send("#{engine.engine_name}_#{I18n.locale}")
      end
    end
  end

  include LocalizedEngines
end
