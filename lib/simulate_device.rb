require 'zlib'

class Simulate_Device
  attr_accessor :device_id, :version, :cable_id, :eth, :ppp, :link_status, :att_db
  attr_reader :json_gzip, :file_att_warn

  def initialize(options={})
    self.device_id = options[:device_id] || '123456'
    self.cable_id = options[:cable_id] || '654321'
    self.version = options[:version] || '1.3.11'
    self.eth = options[:eth] || '1.1.1.1'
    self.ppp = options[:ppp] || '1.1.1.2'
    self.link_status = options[:link_status] || true
    self.att_db = options[:att_db] || '3'
    @json_gzip = json_gzip
  end

  def mondisd_stat; end

  def json_gzip
    @file_att_warn = File.read("imports/att_vals.json")
    Zlib::Deflate.deflate(@file_att_warn)
  end
end
