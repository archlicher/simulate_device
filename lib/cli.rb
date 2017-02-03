require_relative 'responser'
require_relative 'utils'
require_relative 'constants'
require 'readline'

class Cli
	def self.run
		self.greetings
		response_type = self.select_response_type
		begin
			self.send(response_type)
		rescue ArgumentError
			puts "Undefined 'response_type' function: #{response_type}"
			exit
		end
	end

	private

	def self.greetings
		puts ""
		print_str(50, "-", 2)
		left_padding_str(7, " ", "Starting CLI for simulating a device")
		print_str(50, "-", 2)
		puts "- Follow instructions to execute receive specified\n  response from device\n"
		puts "\n- You can exit at all times with: x, q, exit, quit\n\n"
		print_str(50, "-", 2)
	end

	def self.select_response_type
		response_type = read_line('response_type', DISPLAY_RESPONSE_TYPES, RESPONSE_TYPES)

		case response_type
		when 'alive'
			response_type = 'keepalive'
		when 'rec'
			response_type = 'recovery'
		when 'att'
			response_type = 'attenuation_warning'
		when 'att_rec'
			response_type = 'attenuation_recovery'
		end

		return response_type
	end

	def self.keepalive
		params = Responser.create_params_for_responser(REQUIRED_PARAMS[:keepalive])
		rsp = Responser.new('keepalive')
		rsp.response(params)
	end

	def self.short
		puts 's'
	end

	def self.open
		puts 'o'
	end

	def self.recovery
		puts 'r'
	end

	def self.attenuation_warning
		puts 'a_w'
	end

	def self.attenuation_recovery
		puts 'a_r'
	end
end