# frozen_string_literal: true

require_relative "rakuten_travel_api/version"

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
