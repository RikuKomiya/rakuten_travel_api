require "dotenv"
require "byebug"
require_relative "../lib/rakuten_travel_api"
Dotenv.load

RakutenTravelApi.configure do |config|
  config.application_id = ENV.fetch("APPLICATION_ID", nil)
  config.affiliate_id = ENV.fetch("AFFILIATE_ID", nil)
end

res = RakutenTravelApi::Client.new.hotel_detail_search(hotel_no: 176_768)

puts res.hotels.first.hotel_name
