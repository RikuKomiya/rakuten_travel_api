RSpec.describe RakutenTravelApi::Request do
  before do
    RakutenTravelApi.configure do |c|
      c.application_id = "applicationId"
    end
  end

  let(:path) { "/services/api/Travel/KeywordHotelSearch/20170426" }
  subject { RakutenTravelApi::Request.new(path, keyword: keyword).send_request }

  context "success", vcr: { cassette_name: :search_hotel_keyword_success } do
    let(:keyword) { "新宿" }

    it "can send request" do
      expect(subject["hotels"][0]["hotel"][0]["hotelBasicInfo"]["address1"]).to eq "東京都"
    end
  end

  context "error" do
    context "return 404", vcr: { cassette_name: :search_hotel_keyword_not_data } do
      let(:keyword) { "null" }

      it "raise NotFoundError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::NotFoundError
      end
    end
  end
end
