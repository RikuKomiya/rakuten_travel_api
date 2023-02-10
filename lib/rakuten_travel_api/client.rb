# frozen_string_literal: true

require "net/http"

module RakutenTravelApi
  class Client
    def initialize(application_id: nil)
      RakutenTravelApi.configuration.application_id = application_id if application_id
    end

    def keyword_hotel_search(keyword:, params: {})
      path = "/services/api/Travel/KeywordHotelSearch/20170426"
      RakutenTravelApi::Request.new(
        path,
        keyword: keyword,
        **params
      )
    end
  end
end
