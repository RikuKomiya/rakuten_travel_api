module RakutenTravelApi
  module Structs
    HotelPolicyInfo = Struct.new(
      :note,
      :cancel_policy,
      :available_credit_card,
      :about_credit_card_note,
      :about_point_add,
      :about_mileage_add,
      keyword_init: true
    )
  end
end
