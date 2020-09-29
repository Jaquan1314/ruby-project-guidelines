class Enemy < ActiveRecord::Base
    has_many :gokus, through: :battles
    has_many :battles

    def initialize(name, health)
        @name = name
        @health = health
    end
end