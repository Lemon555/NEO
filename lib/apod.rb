require 'http'

module NasaAPI
	# The astronomy picture of the day.
	class Apod
		attr_accessor :pic_url, :pic_title, :pic_explanation

		def initialize(api_token:)
			# Initialize API connection which required api token
			# Get today's astronomy picture
			apod_response = HTTP.get('https://api.nasa.gov/planetary/apod', params: { api_key: api_token })
			apod_info = JSON.parse(apod_response.to_s)
			@pic_url = apod_info['hdurl']
			@pic_title = apod_info['title']
			@pic_explanation = apod_info['explanation']
		end
	end
end
