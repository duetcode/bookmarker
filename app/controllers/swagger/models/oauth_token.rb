# frozen_string_literal: true

module Swagger::Models::OauthToken
  include Swagger::Blocks

  swagger_schema :OauthToken do
    key :type, :object
    key :required, %i[access_token token_type expires_in created_at]

    property :access_token do
      key :type, :string
    end

    property :token_type do
      key :type, :string
    end

    property :expires_in do
      key :type, :integer
    end

    property :created_at do
      key :type, :string
      key :format, 'date-time'
    end
  end
end
