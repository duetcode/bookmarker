# frozen_string_literal: true

class Swagger::Controllers::OauthTokenController
  include Swagger::Blocks

  swagger_path '/oauth/token' do
    operation :post do
      key :description, 'Creates a new token from user credentials'
      key :tags, [
        'oauth'
      ]

      parameter do
        key :name, :user_credentials
        key :in, :body
        key :description, 'Email and password information of the new user with grant type.'
        key :required, true
        schema do
          key :'$ref', :OauthTokenInput
        end
      end

      response 201 do
        key :description, 'Token created'
        schema do
          key :'$ref', :OauthToken
        end
      end

      response 400 do
        key :description, 'Bad Request'
        schema do
          key :type, :object

          property :error do
            key :type, :string
          end

          property :error_description do
            key :type, :string
          end
        end
      end
    end
  end

  swagger_path '/oauth/token/info' do
    operation :get do
      key :description, 'Show details about the token used for authentication'
      key :tags, [
        'oauth'
      ]

      parameter do
        key :name, :Authorization
        key :in, :header
        key :required, true
        schema do
          key :type, :string
        end
      end

      response 200 do
        key :description, 'Details about the specified token'
        schema do
          key :'$ref', :OauthTokenInfo
        end
      end

      response 401 do
        key :description, 'Unauthorized'
        schema do
          key :'$ref', :Unauthorized
        end
      end
    end
  end
end
