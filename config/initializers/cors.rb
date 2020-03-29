Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "https://help-out-oc-p8.herokuapp.com/"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
credentials: true
    end
end