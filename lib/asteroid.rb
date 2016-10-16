require_relative 'nasa_api'

module NeoInfo
	# Set up some attributes of a specific asteroid
	class Asteroid
		attr_reader :asteroid_id
		attr_accessor :name, :estimated_diameter

		def initialize(nasa_api, api_token:, id:)
			# Initialize API connection which required api token and asteroid_id
			# Get the information of the asteroid
			@nasa_api = nasa_api
			@asteroid_id = id
			asteroid_info = @nasa_api.ast_detail(@asteroid_id)
			@name = asteroid_info['name']
			@estimated_diameter = asteroid_info['estimated_diameter']
		end
	end
end
