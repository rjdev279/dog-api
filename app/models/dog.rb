# frozen_string_literal: true

class Dog < ApplicationRecord
  has_many :images, dependent: :destroy
  validates :breed, presence: true
  validates :breed, uniqueness: true
end
