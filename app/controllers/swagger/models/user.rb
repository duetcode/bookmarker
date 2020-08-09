# frozen_string_literal: true

class Swagger::Models::User
  include Swagger::Blocks

  swagger_schema :User do
    key :type, :object
    key :required, %i[id email created_at updated_at]

    property :id do
      key :type, :integer
      key :format, :int64
    end

    property :email do
      key :type, :string
    end

    property :created_at do
      key :type, :string
      key :format, 'date-time'
    end

    property :updated_at do
      key :type, :string
      key :format, 'date-time'
    end
  end
end
