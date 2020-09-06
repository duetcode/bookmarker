# frozen_string_literal: true

module Swagger::Models::OauthTokenInput
  include Swagger::Blocks

  swagger_schema :OauthTokenInput do
    key :type, :object
    key :required, %i[email password grant_type]

    property :email do
      key :type, :string
    end

    property :password do
      key :type, :string
    end

    property :grant_type do
      key :type, :string
    end
  end
end
