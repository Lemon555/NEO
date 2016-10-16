require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require_relative '../lib/apod.rb'
require_relative '../lib/daily_neos.rb'
require_relative '../lib/asteroid.rb'

CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))
RESULTS = YAML.load(File.read('fixtures/results.yml'))

describe 'NEO specifications' do
  it 'should be able to get the amount of todays NEO' do
    neos = NasaAPI::Neos.new(api_token: CREDENTIALS[:api_key])
    neos.count.must_be :>=, 0
  end

  it 'shoud get apod link' do
    apod = NasaAPI::Apod.new(api_token: CREDENTIALS[:api_key])
    apod.pic_url[-4..-1].must_equal('.jpg')
  end

  it 'should be able to get Asteroid name' do
    asteroid = NasaAPI::Asteroid.new("3729835", api_token: CREDENTIALS[:api_key])
    asteroid.name.wont_be_nil
  end
end
