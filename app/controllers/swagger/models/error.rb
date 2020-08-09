# frozen_string_literal: true

class Swagger::Models::Error
  include Swagger::Blocks

  swagger_schema :Error do
    key :required, [:errors]
    property :errors do
      key :type, :object

      property :field_name_one do
        key :type, :array

        items do
          key :type, :string
        end
      end

      property :field_name_two do
        key :type, :array

        items do
          key :type, :string
        end
      end
    end
  end
end
