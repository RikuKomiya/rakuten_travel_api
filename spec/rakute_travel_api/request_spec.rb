RSpec.describe RakutenTravelApi::Request do
  describe "#send_request" do
    before do
      RakutenTravelApi.configure do |c|
        c.application_id = "application_id"
      end
    end
    let(:params) do
      RakutenTravelApi::Parameter.new({ keyword: keyword }).to_params_for_keyword_search
    end

    context "when request is success", :vcr do
      let(:path) { "/services/api/Travel/KeywordHotelSearch/20170426" }
      let(:keyword) { "新宿" }
      subject { RakutenTravelApi::Request.new(path: path, params: params) }

      it "return response" do
        expect(subject.send_request).to be_a RakutenTravelApi::Response
      end
    end

    context "when request is failed", :vcr do
      let(:path) { "/services/api/Travel/KeywordHotelSearch/20170426" }
      let(:keyword) { "hogehoge" }
      subject { RakutenTravelApi::Request.new(path: path, params: params) }

      it "raise error" do
        expect { subject.send_request }.to raise_error RakutenTravelApi::Errors::NotFoundError
      end
    end
  end
end
