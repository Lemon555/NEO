require 'http'

module NasaAPI
	# Main class to setup a near-to-earth object
	class Neos
		attr_accessor :count, :neoData, :update_date

		def initialize(api_token:)
			#Initialize API connection which required api token
			# Get today's NEO feed
			today_response = HTTP.get('https://api.nasa.gov/neo/rest/v1/feed/today', params: { detailed: true, api_key: api_token })
			today_neos = JSON.parse(today_response.to_s)
			@count = today_neos['element_count']
			@neoData = today_neos['near_earth_objects']
		end

		def get_update_date
			#Get the last update date of the NEO data
			status_response = HTTP.get('https://api.nasa.gov/neo/rest/v1/stats', params: { api_key: api_token })
			parse_response = JSON.parse(status_response.to_s)
			@update_date = parse_response['last_updated']
		end
	end
end

