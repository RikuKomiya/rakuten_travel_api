module RakutenTravelApi
  module Structs
    HotelBasicInfo = Struct.new(
      :hotel_no,
      :hotel_name,
      :hotel_information_url,
      :plan_list_url,
      :dp_plan_list_url,
      :review_url,
      :hotel_kana_name,
      :hotel_special,
      :hotel_min_charge,
      :latitude,
      :longitude,
      :postal_code,
      :address1,
      :address2,
      :telephone_no,
      :fax_no,
      :access,
      :parking_information,
      :nearest_station,
      :hotel_image_url,
      :hotel_thumbnail_url,
      :room_image_url,
      :room_thumbnail_url,
      :hotel_map_image_url,
      :review_count,
      :review_average,
      :user_review,
      keyword_init: true
    )
  end
end
