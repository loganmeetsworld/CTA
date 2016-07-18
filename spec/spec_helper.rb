require "simplecov"
require "rails_helper"
require "factory_girl"

SimpleCov.start do
  add_filter 'helpers' 
end

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
  Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end
