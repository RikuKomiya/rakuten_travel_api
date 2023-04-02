# frozen_string_literal: true

require "net/http"

module RakutenTravelApi
  class Client
    def initialize(application_id: nil, affiliate_id: nil)
      RakutenTravelApi.application_id = application_id if application_id
      RakutenTravelApi.affiliate_id = affiliate_id if affiliate_id
    end

    def keyword_hotel_search(keyword:, options: {})
      path = "/services/api/Travel/KeywordHotelSearch/20170426"
      params = RakutenTravelApi::Parameter.new(options.merge(keyword: keyword))
                                          .to_params_for_keyword_search
      req = RakutenTravelApi::Request.new(
        path: path,
        params: params
      )

      req.send_request
    end

    def hotel_detail_search(hotel_no:, options: {})
      path = "/services/api/Travel/HotelDetailSearch/20170426"
      params = RakutenTravelApi::Parameter.new(options.merge(hotelNo: hotel_no))
                                          .to_params_for_hotel_detail_search
      req = RakutenTravelApi::Request.new(
        path: path,
        params: params
      )

      req.send_request
    end
  end
end
