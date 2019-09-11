ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'capybara/poltergeist'

abort('The Rails environment is running in production mode!') if Rails.env.production?

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    url_blacklist: ['/assets/lato/', '/assets/images/', '/fonts/'],
    js_errors: false,
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any'],
    debug: false,
    timeout: 500,
    phantomjs: File.absolute_path(Phantomjs.path)
  )
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include JSONHelpers
  config.include FixtureSeed

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
