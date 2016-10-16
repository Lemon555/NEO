require_relative 'nasa_api'

module NeoInfo
	# Main class to setup a near-to-earth object
	class Neos
		attr_accessor :count, :neoData, :update_date

		def initialize(nasa_api, api_token:)
			#Initialize API connection which required api token
			# Get today's NEO feed
			@nasa_api = nasa_api
			today_neos = @nasa_api.today_feed
			@count = today_neos['element_count']
			@neoData = today_neos['near_earth_objects']
		end

		def get_update_date
			#Get the last update date of the NEO data
			parse_response = @nasa_api.update_date
			@update_date = parse_response['last_updated']
		end
	end
end
