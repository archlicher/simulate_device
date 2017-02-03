require 'open-uri'
require 'readline'
require_relative 'utils'
require_relative 'simulate_device'

class Responser
	attr_accessor :type

	def initialize(type)
		self.type = type
	end

	def self.create_params_for_responser(req_params)
		params = {}
		req_params.each do |p|
			params[p] = read_line(p, DISPLAY_PARAMS_PATTERNS[p], PARAMS_PATTERNS[p], true)
		end

		return params
	end

	def response(params={})
		@device = device(params)
		base_url = 'http://'
		base_url += params['server_ip'] || '127.0.0.1'
		case @type
		when 'keepalive'
			url = "#{base_url}/" + keepalive
		end
		puts url
		data = open(url).readline
		puts data
	end

	def keepalive
		keep_alive = 'devices/keepalive?device_id=' + @device.device_id.to_s
		keep_alive += '?device_version=' + @device.version
		keep_alive += '?eth=' + @device.eth.to_s
		keep_alive += '?ppp=' + @device.ppp.to_s
		keep_alive += '?link_status=' + @device.link_status.to_s
		return keep_alive
	end

	def mondisd_stat
	end

	private

	def device(params={})
		@device = Simulate_Device.new(params)
	end
end