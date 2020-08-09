# frozen_string_literal: true

class Swagger::Controllers::UsersController
  include Swagger::Blocks

  swagger_path '/users' do
    operation :post do
      key :description, 'Creates a new user in the system'
      key :tags, [
        'user'
      ]

      parameter do
        key :name, :user
        key :in, :body
        key :description, 'Email and password information of the new user'
        key :required, true
        schema do
          key :'$ref', :UserInput
        end
      end

      response 201 do
        key :description, 'User created'
        schema do
          property :data do
            key :'$ref', :User
          end

          property :meta do
            key :'$ref', :Meta
          end
        end
      end

      response 422 do
        key :description, 'Unprocessable Entity'
        schema do
          key :'$ref', :Error
        end
      end
    end
  end
end
