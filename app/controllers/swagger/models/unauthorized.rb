# frozen_string_literal: true

module Swagger::Models::Unauthorized
  include Swagger::Blocks

  swagger_schema :Unauthorized do
    key :type, :object

    property :error do
      key :type, :string
    end

    property :error_description do
      key :type, :string
    end

    property :state do
      key :type, :string
    end
  end
end
