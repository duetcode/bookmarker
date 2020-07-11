# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at
end
