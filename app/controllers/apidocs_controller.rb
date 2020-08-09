# frozen_string_literal: true

class ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'

    info do
      key :version, '1.0.0'
      key :title, 'Bookmarker API'
      key :description, 'Bookmarker API documentation'

      contact do
        key :name, 'duetcode.io'
      end
    end

    key :host, 'localhost:3000'
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
    key :schemes,  ['http']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Swagger::Controllers::UsersController,
    Swagger::Models::Error,
    Swagger::Models::Meta,
    Swagger::Models::User,
    Swagger::Models::UserInput,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
