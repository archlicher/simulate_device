#!/usr/bin/env ruby

require './lib/responser.rb'
require 'sinatra'
require 'json'

get '/keepalive' do
	rsp = Responser.new('keepalive')
	rsp.response(params)
end


get '' do
	
end


get '' do
	
end


get '' do
	
end

not_found do
	erb "Page not found"
end