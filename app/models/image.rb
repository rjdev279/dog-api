# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :dog
  validates :url, presence: true
  validates :url, uniqueness: true
end
