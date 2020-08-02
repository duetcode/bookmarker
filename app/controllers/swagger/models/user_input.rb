# frozen_string_literal: true

module Swagger::Models::UserInput
  include Swagger::Blocks

  swagger_schema :UserInput do
    key :required, %i[user]
    property :user do
      key :type, :object
      key :required, %i[email password]

      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end
    end
  end
end
