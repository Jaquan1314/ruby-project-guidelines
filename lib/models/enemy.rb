class Enemy < ActiveRecord::Base
    has_many :gokus, through: :battles
    has_many :battles
    @@enemyattk = ["Kamehameha", "Cell Jr", "Final Flash", "Piledriver"]
    @@prompt = TTY::Prompt.new

    
end

