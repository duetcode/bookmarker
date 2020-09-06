# frozen_string_literal: true

class Swagger::Controllers::OauthController
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
end
