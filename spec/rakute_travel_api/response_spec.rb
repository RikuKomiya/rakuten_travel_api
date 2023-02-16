RSpec.describe RakutenTravelApi::Request do
  before do
    RakutenTravelApi.configure do |c|
      c.application_id = "applicationId"
    end
  end

  let(:path) { "/services/api/Travel/KeywordHotelSearch/20170426" }
  let(:res) { RakutenTravelApi::Request.new(path, keyword: "新宿").send_request }

  subject { RakutenTravelApi::Response.new(res) }

  context "when api-call is success",
          vcr: { cassette_name: :search_hotel_keyword_success } do
    it "return paging info" do
      expect(subject.paging_info).to eq 1
    end

    it "return expected hotels info" do
      expect(subject.hotels[0].hotel_basic_info.values)
        .to eq res["hotels"][0]["hotel"][0]["hotelBasicInfo"].values
      expect(subject.hotels.first.hotel_rating_info.values)
        .to eq res["hotels"][0]["hotel"][1]["hotelRatingInfo"].values
      expect(subject.hotels.first.hotel_detail_info.values)
        .to eq res["hotels"][0]["hotel"][1]["hotelDetailInfo"].values
    end
  end
end
