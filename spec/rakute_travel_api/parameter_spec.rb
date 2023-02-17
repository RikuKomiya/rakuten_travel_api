RSpec.describe RakutenTravelApi::Parameter do
  before do
    RakutenTravelApi.configure do |c|
      c.application_id = "application_id"
      c.affiliate_id = "affiliate_id"
    end
  end

  describe "#to_params_for_keyword_search" do
    subject { RakutenTravelApi::Parameter.new(options).to_params_for_keyword_search }

    context "when options are not specified" do
      let(:options) { {} }
      let(:expected_hash) do
        {
          applicationId: "application_id",
          affiliateId: "affiliate_id",
          formatVersion: 2,
          responseType: "large"
        }
      end

      it "return expected hash" do
        expect(subject).to eq expected_hash
      end
    end

    context "when options are specified" do
      context "when all optons are supported" do
        let(:options) do
          {
            keyword: "新宿",
            page: 2,
            hits: 50
          }
        end

        let(:expected_hash) do
          {
            applicationId: "application_id",
            affiliateId: "affiliate_id",
            formatVersion: 2,
            responseType: "large",
            keyword: "新宿",
            page: 2,
            hits: 50
          }
        end

        it "return expected hash" do
          expect(subject).to eq expected_hash
        end
      end

      context "when all optoins are not supported" do
        let(:options) do
          {
            keyword: "新宿",
            page: 2,
            hits: 50,
            hoge: "hoge",
            foo: "foo"
          }
        end

        it "return expected hash" do
          expect do
            subject
          end.to raise_error RakutenTravelApi::Errors::UnsupportedParamsError,
                             "[:hoge, :foo] are unsupported"
        end
      end
    end
  end
end
