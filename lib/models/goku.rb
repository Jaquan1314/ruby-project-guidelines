class Goku < ActiveRecord::Base
    belongs_to :user
    has_many :battles
    has_many :enemies, through: :battles
end