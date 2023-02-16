module RakutenTravelApi
  module Structs
    HotelOtherInfo = Struct.new(
      :privilege,
      :other_information,
      keyword_init: true
    )
  end
end
