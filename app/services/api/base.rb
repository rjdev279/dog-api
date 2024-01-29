# frozen_string_literal: true

module Api
  class Base
    def self.call(*args)
      new(*args).call
    end
  end
end
