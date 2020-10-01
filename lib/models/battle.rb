class Battle < ActiveRecord::Base
    belongs_to :goku
    belongs_to :enemy

    def begin_battle
        
    end
end