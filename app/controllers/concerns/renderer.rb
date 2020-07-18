# frozen_string_literal: true

module Renderer
  def render_object(resource, status = :ok)
    render json: resource, status: status
  end
end
