module RakutenTravelApi
  module Structs
    HotelDetailInfo = Struct.new(
      :reserve_telephone_no,
      :middle_class_code,
      :small_class_code,
      :area_name,
      :hotel_class_code,
      :checkin_time,
      :checkout_time,
      :last_checkin_time,
      keyword_init: true
    )
  end
end
