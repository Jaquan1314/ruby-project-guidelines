require 'bundler'
require 'require_all'

Bundler.require
# ActiveRecord::Base.logger = nil
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/goku.db')
require_all 'lib'