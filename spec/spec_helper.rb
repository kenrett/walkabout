require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'shoulda/matchers'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  # RSpec 3 does not automatically do this anymore...
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = false

  # config.include Rack::Test::Methods
  config.include Devise::TestHelpers, :type => :controller

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    FactoryGirl.reload
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
    FactoryGirl.reload
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end