require 'ecm_demo/spec_helpers/feature'

RSpec.configure do |c|
  c.include EcmDemo::SpecHelpers::Feature, type: :feature
end