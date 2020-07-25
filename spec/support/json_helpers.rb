# frozen_string_literal: true

module JsonHelpers
  def load_body(response)
    JSON.parse(response.body)
  end

  def load_body_data(response)
    load_body(response)['data']
  end

  def load_body_meta(response)
    load_body(response)['meta']
  end

  def load_body_errors(response)
    load_body(response)['errors']
  end
end
