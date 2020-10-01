class Battle < ActiveRecord::Base
    belongs_to :goku
    belongs_to :enemy

    def self.begin_battle
        Battle.create({ name: "first combat", goku_id: Goku.last.id, user_id: User.last.id, enemy_id: Enemy.last.id})
    end
end