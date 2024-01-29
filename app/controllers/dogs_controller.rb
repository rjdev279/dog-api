# frozen_string_literal: true

class DogsController < ApplicationController
  before_action :set_breed, only: :create

  def create
    status, response, code = Api::V1::Dog::BreedImage.call(@breed)
    render :new, status: :ok,
                 locals: { response: response, breed: @breed, status: status, code: code }
  end

  private

  def set_breed
    @breed = params[:dog][:breed]

    render json: { error: "Dog breed is missing" }, status: :not_found unless @breed
  end
end
