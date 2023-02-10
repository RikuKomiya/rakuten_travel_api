RSpec.describe RakutenTravelApi::Client do
  it "can be initizalie" do
    expect { RakutenTravelApi::Client.new }.not_to raise_error
  end
end
