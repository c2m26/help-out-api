if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_help-out", domain: "help-out-api"
else
    Rails.application.config.session_store :cookie_store, key: "_help-out"
end