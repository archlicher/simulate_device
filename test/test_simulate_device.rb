require 'minitest/autorun'
require 'simulate_device'

class Simulate_DeviceTest < Minitest::Test
	before do
		device = Simulate_Device.new({ device_ip: '1.1.1.1',
																	 device_id: 1,
																	 version: '1.3.11',
																	 cable_id: 1,
																	 eth: '1.2.3.4',
																	 ppp: '1.2.3.4' })
	end

	def test_attributes_default_eth_ppp
		assert_equal '1.1.1.1', device.device_ip
		assert_equal 1, device.device_id
		assert_equal '1.3.11', device.version
		assert_equal 1, device.cable_id
		assert_equal true, device.eth
		assert_equal true, device.ppp
	end

	def test_attributes
		assert_equal '1.1.1.1', device.device_ip
		assert_equal 1, device.device_id
		assert_equal '1.3.11', device.version
		assert_equal 1, device.cable_id
		assert_equal '1.2.3.4', device.eth
		assert_equal '1.2.3.4', device.ppp
	end

	def test_keepalive
		assert_equal '1.1.1.1', device.device_ip
		assert_equal 1, device.device_id
		assert_equal '1.3.11', device.version
		assert_equal 1, device.cable_id
		assert_equal '1.2.3.4', device.eth
		assert_equal '1.2.3.4', device.ppp
	end

	def test_mondisd_stat
		assert_equal '1.1.1.1', device.device_ip
		assert_equal 1, device.device_id
		assert_equal '1.3.11', device.version
		assert_equal 1, device.cable_id
		assert_equal '1.2.3.4', device.eth
		assert_equal '1.2.3.4', device.ppp
	end
end
