# frozen_string_literal: true

require_relative "string_helper"
require "byebug"

module RakutenTravelApi
  class Hotel
    attr_reader :hotel_basic_info, :hotel_rating_info, :hotel_detail_info, :hotel_facilities_info,
                :hotel_policy_info, :hotel_other_info

    using RakutenTravelApi::StringHelper

    HOTEL_INFO_NAMES = %w[hotel_basic_info hotel_rating_info hotel_detail_info
                          hotel_facilities_info hotel_policy_info hotel_other_info].freeze

    def initialize(json_hotel)
      @json_hotel = json_hotel
      HOTEL_INFO_NAMES.each do |name|
        struct = "RakutenTravelApi::Structs::#{name.capitalize_from_snake}".to_const
        v = struct.new(tranform_json(name.to_camel))
        instance_variable_set("@#{name.to_snake}", v)
      end
    end

    def method_missing(method)
      if (info_obj = HOTEL_INFO_NAMES.find { |name| send(name).respond_to?(method) })
        send(info_obj).send(method)
      else
        super
      end
    end

    def respond_to_missing?(sym, include_private); end

    private

    attr_reader :json_hotel

    def tranform_json(param_name)
      json_hotel.find do |json|
        json[param_name]
      end[param_name].to_h.transform_keys(&:to_snake)
    end
  end
end
