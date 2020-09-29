class CreateBattles < ActiveRecord::Migration[5.1]
    def change
        create_table :battles do |t|
            t.string :name
            t.string :user
            t.string :enemy
        end
    end
end