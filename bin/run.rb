require_relative '../config/environment'
require 'require_all'
require 'pry'

User.sign_in
User.main_menu
#binding.pry
User.game_start
