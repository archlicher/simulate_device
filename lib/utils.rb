#!/usr/bin/env ruby
require 'readline'

def left_padding_str(n, symbol, str)
	n.times { print symbol }
	puts str
	puts ""
end

def print_str(n, symbol, new_lines = 0)
	n.times do print symbol end
	new_lines.times { puts "" }
end

def read_line(param, display_opts, options, regex = false)
	puts " Please input '#{param}'. Possible options/pattern are:"
	display_opts.each { |op| puts " - #{op}" }
	puts ""
	cmd = "abv"
	if regex
		until options.match(cmd) != nil
			cmd = single_read(param)
		end

		return cmd
	end

	until options.include?(cmd)
		cmd = single_read(param)
	end

	cmd
end

def single_read(param)
	prompt = " Enter #{param}: "
	cmd = Readline.readline(prompt, true)

	exit if EXIT_CMDS.include?(cmd)

	cmd
end
