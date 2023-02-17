# frozen_string_literal: true

require_relative "string_helper"

module RakutenTravelApi
  class Response
    attr_reader :paging_info, :hotels

    using RakutenTravelApi::StringHelper

    PagingInfoStruct = Struct.new(
      :record_count,
      :page_count,
      :page,
      :first,
      :last,
      keyword_init: true
    )

    def initialize(json_response)
      @paging_info = PagingInfoStruct.new(
        json_response["pagingInfo"].to_h.transform_keys(&:to_snake)
      )
      @hotels = json_response["hotels"].map do |json_hotel|
        Hotel.new(json_hotel["hotel"])
      end
    end
  end
end
