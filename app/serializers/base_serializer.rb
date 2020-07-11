# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at
end
