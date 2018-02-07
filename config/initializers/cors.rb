Rails.application.config.middleware.insert_before 0, Rack::Cors, logger: (-> { Rails.logger }) do
  allow do
    origins '*'
    resource '/graphql',
      headers: :any,
      methods: :post,
      max_age: 60
  end
end

