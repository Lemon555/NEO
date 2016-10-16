require 'http'
require 'json'

module NeoInfo
  # Service for all NASA API calls
  class NasaApi
    NASA_URL = 'https://api.nasa.gov'
    API_VER = 'v1'
    NEO_API_URL = URI.join(NASA_URL, "neo/rest/#{API_VER}/")

    def initialize(api_key:)
      #Initialize API connection by getting access_token
      @api_token = api_key
    end

    def today_feed
      object_response = HTTP.get(URI.join(NEO_API_URL, "feed/today"),
                                  params: { detailed: true,
                                            api_key: api_key})
      JSON.load(object_response.to_s)
    end

    def update_date
      status_response = HTTP.get(URI.join(NEO_API_URL, "stats"),
                                             params: { api_key: api_token })
      JSON.load(status_response.to_s)
    end

    def daily_picture
      apod_response = HTTP.get(URI.join(NASA_API, "planetary/apod"),
                                          params: { api_key: api_token })
      JSON.load(apod_response.to_s)['hdurl']
    end

    def ast_detail(ast_id)
      detail_response = HTTP.get(nasa_resourse_url(ast_id),
                                params: { api_key: api_key })
      JSON.load(detail_response.to_s)
    end

    def nasa_resourse_url(id)
      URI.join(NEO_API_URL, "neo/#{id}/")
    end
  end
end
