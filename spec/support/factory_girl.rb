require 'factory_girl_rails'

FactoryGirl.factories.clear

[
  Ecm::Blog::Engine,
  Ecm::Cms::Engine,
  Ecm::Comments::Engine,
  Ecm::Contact::Engine,
  Ecm::Courses::Engine,
  Ecm::Downloads::Engine,
  Ecm::Links::Engine,
  Ecm::News::Engine,
  Ecm::Pictures::Engine,
  Ecm::Rbac::Engine,
  Ecm::References::Engine,
  Ecm::Sliders::Engine,
  Ecm::Staff::Engine,
  Ecm::Tags::Engine,
  Ecm::Translations::Engine,
  Ecm::TimeTracking::Engine,
  Ecm::UserArea::Engine,
  Ecm::Videos::Engine,

  Ecm::Youtube::Engine
].each do |engine|
  FactoryGirl.definition_file_paths << engine.root.join(*%w(spec factories))
end

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end