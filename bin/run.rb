require_relative '../config/environment'
require 'require_all'

current_user = User.new
User.sign_in
current_user.main_menu
current_user.game_start
