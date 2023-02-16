module RakutenTravelApi
  module Structs
    HotelRatingInfo = Struct.new(
      :service_average,
      :location_average,
      :room_average,
      :equipment_average,
      :bath_average,
      :meal_average,
      keyword_init: true
    )
  end
end
