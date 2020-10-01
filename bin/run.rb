require_relative '../config/environment'
require 'require_all'
require 'pry'
@@prompt = TTY::Prompt.new

def sign_in
    puts "Sign in or sign up"
    username = @@prompt.ask("Username:")
    system("clear")
    User.find_or_create_by(name: username)
    puts "Welcome #{username}!"
end

# def current_user

# end

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

def enter_goku
    Goku.create({ user_id: User.last.id, health: 100, honor: 4})
    system("clear")
end

def game_start
     option = @@prompt.select("Do you want to fight or check your health?", %w(Continue HP))
    if option == "HP"
        system("clear")
        puts "Your current hp is #{Goku.last.health}"
    elsif option == "Continue"
        system("clear")
        puts "Prepare for battle, #{User.last.name}!"
    end
end

def enter_enemy
    Enemy.create({ name:"Cell", health: 120})
end

def begin_battle
    Battle.create({ name: "Don't Lose", goku_id: Goku.last.id, user_id: User.last.id, enemy_id: Enemy.last.id})
end

def goku_health_check
    if 0 >= Goku.last.health
        puts "Yikes, you really got your butt kicked."
        hide_evidence = @@prompt.yes?("Wanna delete the record of your embarrassing defeat?")
            if hide_evidence == "Yes"
                Battle.last.destroy
            elsif hide_evidence == "No"
                puts "Why? Whatever, its fine"
            end
    else
        puts "Keep on fighting!"
    end 
end

def enemy_health_check
    if 0 >= Enemy.last.health
        puts "Congratulations, the earth lives to be polluted another day!"
    end 
end

def goku_turn
    current_goku = Goku.last
    current_enemy = Enemy.last
    my_health = @@prompt
    goku_moves = @@prompt.select("Choose an attack:", %w(Kamehameha GroinKick HairPull SpiritBomb PowerPole EyePoke))
    if goku_moves == "Kamehameha"
        puts "Ka...Me...Ha...Me...HA!!!"
        current_enemy.health = current_enemy.health - 20
        current_enemy.save
        puts "Nice, you did 20 damage!"
    elsif goku_moves == "GroinKick"
        puts "I don't know this will even work on cell!"
        current_enemy.health = current_enemy.health - 40
        current_enemy.save
        puts "Whoa! 40 damage?!?!?"
        puts "I don't know what I kicked, but it must've hurt"
    elsif goku_moves == "HairPull"
        puts "If there's no hair what do I pull?"
        current_enemy.health = current_enemy.health - 30
        current_enemy.save
        puts "30 damage!"
        puts "I feel bad with these cheap tactics, but I must defend the earth!"
    elsif goku_moves == "SpiritBomb"
        puts "Earth, lend me your energy!"
        puts "What the heck??? spirit bomb did 5 to me and only 1 to my enemy?"
        current_enemy.health = current_enemy.health - 1
        current_enemy.save
        current_goku.health = current_goku.health - 5
        current_goku.save
    elsif goku_moves == "PowerPole"
        puts "gotta go back to my roots!"
        puts "Only 10 damage? Guess thats why I stopped using it"
        current_enemy.health = current_enemy.health - 10
        current_enemy.save
    elsif goku_moves == "EyePoke"
        puts "This is rude but you gotta do what you gotta do!"
        puts "Holy smokes! 45 Damage!"
        current_enemy.health = current_enemy.health - 45
        current_enemy.save
    end

    def enemy_turn_1
        current_goku = Goku.last
        puts "Let's see how you like my cell Jr!"
        puts "Only 20 damage"
        current_goku.health = current_goku.health - 20
        current_goku.save
    end

    def enemy_turn_2
        current_goku = Goku.last
        puts "You're out of your element! Taste this piledriver!"
        puts "Ouch, 50 damage"
        current_goku.health = current_goku.health - 50
        current_goku.save
    end

    def enemy_turn_3
        current_goku = Goku.last
        puts "Kamehameha!"
        puts "100 damage! you're toast!"
        current_goku.health = current_goku.health - 100
        current_goku.save
    end
    
end


#Can fulfill the D in crud by giving user the option to destroy the last battle when they lose
#write something like "would you like to destroy the record of this embarrassing battle?"
#maybe it should be a user class method called within the health check?

sign_in

main_menu
enter_goku 
game_start
enter_enemy
begin_battle
puts "Remember to be true to yourself, Goku. Anyone can win with dirty tactics, but you must be honorable!"
goku_turn
enemy_turn_1
goku_health_check
goku_turn
enemy_turn_2
goku_health_check
goku_turn
enemy_turn_3
enemy_health_check
goku_health_check

#binding.pry

#START WRITING ALL METHODS HERE SO THAT THEY DONT HAVE TO BE CLASS METHODS
#USE SCREENSHOT FROM UPDATE AND DELETE W NICK 
#FOLLOW THAT FORMAT IN RUN.RB METHODS TO MAKE THE GAME WORK