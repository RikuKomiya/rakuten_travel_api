RSpec.describe RakutenTravelApi::Client do
  it "can be initizalie" do
    expect { RakutenTravelApi::Client.new }.not_to raise_error
  end

  describe "#keyword_hotel_search" do
    before do
      RakutenTravelApi.configure do |config|
        config.application_id = ENV.fetch("APPLICATION_ID", nil)
      end
    end
    context "when request is successful", :vcr do
      let(:client) { RakutenTravelApi::Client.new }
      let(:response) { client.keyword_hotel_search(keyword: "東京") }
      let(:first_hotel) { response.hotels.first }

      it "returns response" do
        expect(response).to be_an_instance_of(RakutenTravelApi::Response)
      end

      it "returns an array of hotel" do
        expect(first_hotel).to be_an_instance_of(RakutenTravelApi::Hotel)
      end
    end

    context "when request is failed", :vcr do
      let(:client) { RakutenTravelApi::Client.new }
      let(:response) { client.keyword_hotel_search(keyword: "hogehoge") }

      it "returns an array" do
        expect { response }.to raise_error RakutenTravelApi::Errors::NotFoundError
      end
    end
  end

  describe "#hotel_detail_search" do
    before do
      RakutenTravelApi.configure do |config|
        config.application_id = ENV.fetch("APPLICATION_ID", nil)
      end
    end

    context "when request is successful", :vcr do
      let(:client) { RakutenTravelApi::Client.new }
      let(:response) { client.hotel_detail_search(hotel_no: 176_768) }
      let(:hotel) { response.hotels.first }

      it "returns response" do
        expect(response).to be_an_instance_of(RakutenTravelApi::Response)
      end

      it "returns an array of hotel" do
        expect(hotel).to be_an_instance_of(RakutenTravelApi::Hotel)
      end
    end

    context "when request is failed", :vcr do
      let(:client) { RakutenTravelApi::Client.new }
      let(:response) { client.hotel_detail_search(hotel_no: 1_000_000) }

      it "returns an array" do
        expect { response }.to raise_error RakutenTravelApi::Errors::NotFoundError
      end
    end
  end
end
