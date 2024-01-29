# frozen_string_literal: true

class CreateDogIntr < ActiveInteraction::Base
  string :breed, :image

  validates :breed, presence: true

  def execute
    dog = Dog.find_or_initialize_by(breed: inputs[:breed])
    dog.images.build(url: inputs[:image])

    errors.merge!(dog.errors) unless dog.save

    dog
  end
end
