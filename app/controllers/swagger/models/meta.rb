# frozen_string_literal: true

class Swagger::Models::Meta
  include Swagger::Blocks

  swagger_schema :Meta do
    key :type, :object
    key :required, %i[resource count]

    property :resource do
      key :type, :string
    end

    property :count do
      key :type, :integer
    end
  end
end
