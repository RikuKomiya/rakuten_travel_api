# frozen_string_literal: true

require "net/http"

module RakutenTravelApi
  class Client
    def initialize(application_id: nil, affiliate_id: nil)
      RakutenTravelApi.application_id = application_id if application_id
      RakutenTravelApi.affiliate_id = affiliate_id if affiliate_id
    end

    def keyword_hotel_search(keyword:, params: {})
      path = "/services/api/Travel/KeywordHotelSearch/20170426"
      req = RakutenTravelApi::Request.new(
        path,
        keyword: keyword,
        **params
      )

      req.send_request
    end
  end
end
