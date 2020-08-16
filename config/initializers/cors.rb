# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:8080'
    resource '/api/v1/*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
