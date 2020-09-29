class Enemy < ActiveRecord::Base
    has_many :gokus, through: :battles
    has_many :battles
end