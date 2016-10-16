require_relative 'nasa_api'

module NeoInfo
	# The astronomy picture of the day.
	class Apod
		attr_accessor :pic_url, :pic_title, :pic_explanation

		def initialize(nasa_api, api_token:)
			# Initialize API connection which required api token
			# Get today's astronomy picture
			@nasa_api = nasa_api
			apod_info = @nasa_api.daily_picture
			@pic_url = apod_info['hdurl']
			@pic_title = apod_info['title']
			@pic_explanation = apod_info['explanation']
		end
	end
end
