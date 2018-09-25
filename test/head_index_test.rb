require 'minitest/autorun'
require 'heat-index'

class HeatIndexTest < Minitest::Test
  def test_calculation
	assert  25 == HeatIndex.new(temperature: Celsius.new(20), humidity: 60).calculate.as_c.rounded_value
	assert  22 == HeatIndex.new(temperature: Celsius.new(20), humidity: 75).calculate.as_c.rounded_value
	assert  18 == HeatIndex.new(temperature: Celsius.new(20), humidity: 90).calculate.as_c.rounded_value
	assert  25 == HeatIndex.new(temperature: Fahrenheit.new(68), humidity: 60).calculate.as_c.rounded_value
	assert  22 == HeatIndex.new(temperature: Fahrenheit.new(68), humidity: 75).calculate.as_c.rounded_value
	assert  18 == HeatIndex.new(temperature: Fahrenheit.new(68), humidity: 90).calculate.as_c.rounded_value
	assert  25 == HeatIndex.new(temperature: Kelvin.new(293), humidity: 60).calculate.as_c.rounded_value
	assert  22 == HeatIndex.new(temperature: Kelvin.new(293), humidity: 75).calculate.as_c.rounded_value
	assert  18 == HeatIndex.new(temperature: Kelvin.new(293), humidity: 90).calculate.as_c.rounded_value
  end
end