class Battle < ActiveRecord::Base
    belongs_to :goku
    belongs_to :enemy
    
    def initialize(goku, enemy)
        @goku = goku
        @enemy = enemy
    end
end