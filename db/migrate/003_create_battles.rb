class CreateBattles < ActiveRecord::Migration[5.1]
    def change
        create_table :battles do |t|
            t.string :name
            t.integer :goku_id
            t.integer :user_id
            t.integer :enemy_id
        end
    end
end