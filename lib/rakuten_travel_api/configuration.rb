module RakutenTravelApi
  module Configuration
    attr_writer :application_id
    attr_accessor :affiliate_id

    def configure
      yield self
    end

    def application_id
      return @application_id if @application_id

      raise RakutenTravelApi::Errors::ApplicationIdMissingError, "application id missing"
    end
  end
end
