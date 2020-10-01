require 'pry'
class User < ActiveRecord::Base
    has_many :gokus
    has_many :battles, through: :gokus
    has_many :enemies, through: :gokus
    @@prompt = TTY::Prompt.new

    def self.sign_in
        puts "Sign in or sign up"
        username = @@prompt.ask("Username:")
        system("clear")
        User.find_or_create_by(name: username)
        puts "Welcome #{username}!"
        
    end
    #binding.pry

    def self.main_menu
        user_choice = @@prompt.select("Choose an option below:", %w(Start Leaderboards Exit))
        if user_choice == "Start"
            system("clear")
            puts "Get ready, you are playing as Goku"
        elsif user_choice == "Leaderboards"
            system("clear")
            "Leaderboards"
        else
            exit
        end
    end

    def self.game_start
        
        current_goku = Goku.create({ user_id: User.last.id, health: 100, honor: 4})
        system("clear")
        option = @@prompt.select("Do you want to fight or check your health?", %w(Continue HP))
        if option == "HP"
            system("clear")
            puts "Your current hp is #{current_goku.health}"
        elsif option == "Continue"
            system("clear")
            puts "Prepare for battle, #{User.last.name}!"
        end
    end

    
end

#i think for game start we need to create a goku at the beginnging, then give the choice of hp or continue
#also to simplify combat, we may have to write everything explicitly. So if goku has 12 moves, there would 
#be 3 different kinds of turns.  one with atks 1-4, 5-8, 9-12 and for enemy they could have set patterns atk1, atk2 etc
#could have a method for each attack, method for death, method for health updates during battle, method for honor gets too high
