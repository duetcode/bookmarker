# frozen_string_literal: true

module Renderer
  def render_object(resource, status = :ok)
    render json: resource, status: status
  end

  def render_errors(errors, status = :unprocessable_entity)
    render json: errors, status: status
  end
end
