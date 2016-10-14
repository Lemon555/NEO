# Specifications of first.rb
require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'date'

`ruby first.rb`
RESULTS = YAML.load(File.read('spec/fixtures/results.yml'))

describe 'NEO specifications' do
  it 'should be able to get the amount of todays NEO' do
    RESULTS[:today_count].must_be :>=, 0
  end

  it 'should be able to get NASA update date information' do
    test_date = Time.new(2016, 10, 12, 0, 0)
    get_date = Date.strptime(RESULTS[:update_date], '%Y-%m-%d')
    get_date.must_be :>, test_date.to_date
  end

  it 'should be albe to get a URL of image' do
    RESULTS[:daily_pic][-4..-1].must_equal('.jpg')
  end
end
