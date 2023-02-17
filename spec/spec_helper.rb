# frozen_string_literal: true

require "rakuten_travel_api"
require "vcr"
require "webmock"

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: %i[method path query body]
  }
  c.filter_sensitive_data("<APPLICATION_ID>") { RakutenTravelApi.application_id }
  c.filter_sensitive_data("<AFFILIATE_ID>") { RakutenTravelApi.affiliate_id }
end
