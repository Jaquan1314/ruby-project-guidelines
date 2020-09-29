class Goku < ActiveRecord::Base
    belongs_to :user
    has_many :battles
    has_many :enemies, through: :battles

    attr_accessor :health, :user, :honor
    attr_reader :name

    def initialize(name, health, user, honor)
        @name = name
        @health = health
        @user = user
        @honor = honor
    end
end