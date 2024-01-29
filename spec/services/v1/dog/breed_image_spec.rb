# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::Dog::BreedImage do
  describe "#get" do
    let(:breed) { "hound" }

    let(:get_image_response) do
      VCR.use_cassette("fixtures/breed_image") {described_class.new(breed).call }
    end

    let(:get_invalid_image_response) do
      VCR.use_cassette("fixtures/breed_invalid_image_response") {described_class.new(nil).call }
    end

    context "with valid breed" do
      it "can fetch & parse dog data" do
        expect(get_image_response).to be_kind_of(Array)
        expect(get_image_response[0]).to eq('success') 
      end
    end

    context "with blank breed" do
      it "receive error" do
        expect(get_invalid_image_response).to be_kind_of(Array)
        expect(get_invalid_image_response[0]).to eq("error")
      end
    end

  end
end
