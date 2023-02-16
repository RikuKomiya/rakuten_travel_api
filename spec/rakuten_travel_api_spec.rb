# frozen_string_literal: true

RSpec.describe RakutenTravelApi do
  it "has a version number" do
    expect(RakutenTravelApi::VERSION).not_to be nil
  end

  describe "configuration" do
    before do
      RakutenTravelApi.configure do |c|
        c.application_id = application_id
        c.affiliate_id = affiliate_id
      end
    end

    context "when application_id exits in config" do
      let(:application_id) { "application_id" }
      let(:affiliate_id) { nil }

      it "has application_id" do
        expect(RakutenTravelApi.application_id).to eq application_id
      end

      context "when affiliate_id exists" do
        it "has affiliate_id" do
          expect(RakutenTravelApi.affiliate_id).to eq affiliate_id
        end
      end
    end

    context "when application_id doesn't exist in config" do
      let(:application_id) { nil }
      let(:affiliate_id) { nil }

      it "raise ApplicationIdMissingError" do
        expect do
          RakutenTravelApi.application_id
        end.to raise_error RakutenTravelApi::Errors::ApplicationIdMissingError
      end
    end
  end
end
