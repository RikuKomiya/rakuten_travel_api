module RakutenTravelApi
  module Structs
    HotelFacilitiesInfo = Struct.new(
      :hotel_room_num,
      :room_facilities,
      :hotel_facilities,
      :about_meal_place,
      :about_bath,
      :about_leisure,
      :handicapped_facilities,
      :linguistic_level,
      keyword_init: true
    )
  end
end
