class CreateGoku < ActiveRecord::Migration[5.1]
    def change
        create_table :gokus do |t|
            t.integer :user_id
            t.integer :health
            t.integer :honor
        end
    end
end