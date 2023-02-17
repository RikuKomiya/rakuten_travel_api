require_relative "string_helper"

module RakutenTravelApi
  class Parameter
    using RakutenTravelApi::StringHelper

    def initialize(options)
      @application_id = RakutenTravelApi.application_id
      @affiliate_id = RakutenTravelApi.affiliate_id
      @options = options.transform_keys { |key| key.to_s.to_camel.to_sym }
    end

    def to_params_for_keyword_search
      default_params = default_common_params.merge(default_keyword_search_params)

      to_params(default_params)
    end

    private

    attr_reader :application_id, :affiliate_id, :options

    def to_params(default_params)
      unsupported_params = options.keys.difference(default_params.keys)

      unless unsupported_params.empty?
        raise RakutenTravelApi::Errors::UnsupportedParamsError,
              "#{unsupported_params} are unsupported"
      end

      default_params.merge(options).compact
    end

    def default_common_params
      {
        applicationId: application_id,
        affiliateId: affiliate_id,
        format: nil,
        callback: nil,
        elements: nil,
        formatVersion: 1
      }
    end

    def default_keyword_search_params
      {
        carrier: nil,
        page: nil,
        hits: nil,
        datumType: nil,
        keyword: nil,
        middleClassCode: nil,
        searchField: nil,
        hotelChainCode: nil,
        hotelThumbnailSize: nil,
        responseType: "large",
        sort: nil
      }
    end
  end
end
