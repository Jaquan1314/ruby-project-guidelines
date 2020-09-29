class User < ActiveRecord::Base
    has_many :gokus
    has_many :battles, through: :gokus
    has_many :enemies, through: :gokus
    @@prompt = TTY::Prompt.new

    def self.sign_in
        puts "Sign in or sign up"
        @username = @@prompt.ask("Username:")
        system("clear")
        User.find_or_create_by(name: @username)
        puts "Welcome #{@username}!"
        
    end

    def main_menu
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

    def game_start
        option = @@prompt.select("Do you want to continue to the battle or check health?", %w(Continue Hp))
        if option == "Hp"
            puts "Your current hp is #{self.gokus.health}"
        elsif option == "Continue"
            # new_goku = Goku.new(user_id: self.user_id, health: 100, honor: 4)
        end
    end
end