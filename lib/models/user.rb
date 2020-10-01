require 'pry'
class User < ActiveRecord::Base
    has_many :gokus
    has_many :battles, through: :gokus
    has_many :enemies, through: :gokus
    @@prompt = TTY::Prompt.new

    
        

    #binding.pry

    

    

    def gokus_turn
        puts "I will protect the earth no matter what!"

    end
end

