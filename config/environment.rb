require 'bundler'
require 'require_all'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

current_user = User.new
User.sign_in
current_user.main_menu
current_user.game_start