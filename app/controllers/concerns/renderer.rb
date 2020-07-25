# frozen_string_literal: true

module Renderer
  def render_object(resource, **options)
    options.merge!(json: resource, root: :data)
    options.merge!(status: :ok) unless options.key?(:status)

    render options
  end

  def render_errors(errors, status = :unprocessable_entity)
    render json: errors, status: status
  end
end
