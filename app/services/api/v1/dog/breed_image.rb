# frozen_string_literal: true

module Api
  module V1
    module Dog
      class BreedImage < Api::Base
        def initialize(breed)
          @base_url = URI.parse(DOG_API_BASE_URL)
          @breed = breed
        end

        def call
          response = Api::DogInformationProvider.new(@base_url).fetch_image(@breed)
          if response["status"] == "success"
            CreateDogIntr.run!(breed: @breed, image: response["message"])
          end
          [response["status"], response["message"], response["code"]]
        end
      end
    end
  end
end
