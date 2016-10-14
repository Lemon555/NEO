require 'http'

module NasaAPI
	# Set up some attributes of a specific asteroid
	class Asteroid
		attr_reader :asteroid_id
		attr_accessor :name, :estimated_diameter

		def initialize(api_token:, id)
			# Initialize API connection which required api token and asteroid_id
			# Get the information of the asteroid
			@asteroid_id = id
			asteroid_response = HTTP.get( URI.join('https://api.nasa.gov/neo/rest/v1/neo/', "#{@asteroid_id}"), params: { api_key: api_token })
			asteroid_info = JSON.parse(asteroid_response.to_s)
			@name = asteroid_info['name']
			@estimated_diameter = asteroid_info['estimated_diameter']
		end
	end
end



