require 'srfax'

SrFax.setup do |config|
  config.defaults[:access_id] = ENV["srfax_access_id"]
  config.defaults[:access_pwd] = ENV["srfax_access_pwd"]
  config.connection_defaults[:timeout] = 180
end