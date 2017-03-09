require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './model_helper'

def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
  DataMapper.auto_upgrade!
  DataMapper.finalize
end

setup
