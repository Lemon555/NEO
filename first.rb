require 'yaml'
require 'http'

# Create a API response dump
credentials = YAML.load(File.read('credentials.yml'))
nasa_response = {}
results = {}

# Initialize API token
api_token = credentials[:api_key]

# Get today's NEO feed
today_response = HTTP.get('https://api.nasa.gov/neo/rest/v1/feed/today', params: { detailed: true, api_key: api_token })
nasa_response[:today] = today_response
today_count = JSON.parse(today_response.to_s)['element_count']
today_neos =  JSON.parse(today_response.to_s)['near_earth_objects']
results[:today_count] = today_count
results[:today_neos] = today_neos

# Get NASA status
status_response = HTTP.get('https://api.nasa.gov/neo/rest/v1/stats', params: { api_key: api_token })
nasa_response[:status] = status_response
update_date = JSON.parse(status_response.to_s)['last_updated']
results[:update_date] = update_date

# Get NASA APOD
apod_response = HTTP.get('https://api.nasa.gov/planetary/apod', params: { api_key: api_token })
nasa_response[:apod] = apod_response
daily_pic = JSON.parse(apod_response.to_s)['hdurl']
pic_explanation = JSON.parse(apod_response.to_s)['explanation']
results[:daily_pic] = daily_pic
results[:pic_explanation] = pic_explanation

# Write File
File.write('nasa_response.yml', nasa_response.to_yaml)
File.write('results.yml', results.to_yaml)
