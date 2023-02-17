RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.around :each, :vcr do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").gsub(
      %r{[^\w/]+}, "_"
    )
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end
