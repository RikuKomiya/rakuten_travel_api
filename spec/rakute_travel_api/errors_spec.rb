RSpec.describe RakutenTravelApi::Errors do
  describe "self.raise_response_error" do
    subject { RakutenTravelApi::Errors.raise_response_error(code, message) }

    let(:message) { "error message" }

    context "when code is 400" do
      let(:code) { 400 }
      it "raise WrongParameterError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::WrongParameterError
      end
    end

    context "when code is 404" do
      let(:code) { 404 }
      it "raise NotFoundError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::NotFoundError
      end
    end

    context "when code is 429" do
      let(:code) { 429 }
      it "raise TooManyRequestError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::TooManyRequestError
      end
    end

    context "when code is 500" do
      let(:code) { 500 }
      it "raise SystemError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::SystemError
      end
    end

    context "when code is 503" do
      let(:code) { 503 }
      it "raise ServiceUnavailableError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::ServiceUnavailableError
      end
    end

    context "when code is undefined" do
      let(:code) { 999 }
      it "raise NotDefinedError" do
        expect { subject }.to raise_error RakutenTravelApi::Errors::NotDefinedError
      end
    end
  end
end
