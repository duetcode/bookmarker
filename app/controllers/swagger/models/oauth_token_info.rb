# frozen_string_literal: true

module Swagger::Models::OauthTokenInfo
  include Swagger::Blocks

  swagger_schema :OauthTokenInfo do
    key :type, :object
    key :required, %i[resource_owner_id scope expires_in created_at]

    property :resource_owner_id do
      key :type, :integer
      key :format, :int64
    end

    property :scope do
      key :type, :array

      items do
        key :type, :string
      end
    end

    property :expires_in do
      key :type, :integer
    end

    property :created_at do
      key :type, :integer
      key :format, :int64
    end
  end
end
