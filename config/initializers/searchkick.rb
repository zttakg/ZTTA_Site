if Rails.env.staging? || Rails.env.production?
  Searchkick.client =
    Elasticsearch::Client.new(
      url: ENV['ELASTICSEARCH_URL'],
      transport_options: {request: {timeout: 10}}
    )
end
