class Battle < ActiveRecord::Base
    belongs_to :goku
    belongs_to :enemy
end