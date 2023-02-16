# frozen_string_literal: true

require_relative "rakuten_travel_api/version"
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
  class Error < StandardError; end
  class ApplicationIdMissingError < StandardError; end

  class Configuration
    attr_writer :application_id

    def initialize
      @application_id = nil
    end

    def application_id
      return @application_id if @application_id

      raise ApplicationIdMissingError, "application id missing"
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= RakutenTravelApi::Configuration.new
  end

  def self.configure
    yield configuration
  end
end
