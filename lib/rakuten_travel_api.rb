# frozen_string_literal: true

require_relative "rakuten_travel_api/version"
require_relative "rakuten_travel_api/configuration"
require_relative "rakuten_travel_api/client"
require_relative "rakuten_travel_api/request"
require_relative "rakuten_travel_api/response"
require_relative "rakuten_travel_api/hotel"
require_relative "rakuten_travel_api/errors"
require_relative "rakuten_travel_api/structs/hotel_basic_info"
require_relative "rakuten_travel_api/structs/hotel_rating_info"
require_relative "rakuten_travel_api/structs/hotel_detail_info"
require_relative "rakuten_travel_api/structs/hotel_facilities_info"
require_relative "rakuten_travel_api/structs/hotel_policy_info"
require_relative "rakuten_travel_api/structs/hotel_other_info"

module RakutenTravelApi
  extend RakutenTravelApi::Configuration
end
