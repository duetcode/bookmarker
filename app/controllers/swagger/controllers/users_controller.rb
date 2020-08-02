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
    end
  end
end
