require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  # RSpec 3 does not automatically do this anymore...
  config.infer_spec_type_from_file_location!

  # config.include Rack::Test::Methods
  config.include Devise::TestHelpers, :type => :controller

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.after(:suite) do
    FileUtils.rm_r Rails.root.join("public/system") if File.directory?(Rails.root.join("public/system"))
    FileUtils.mkdir_p Rails.root.join("public/system") unless File.directory?(Rails.root.join("public/system"))
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
