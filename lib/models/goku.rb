class Goku < ActiveRecord::Base
    belongs_to :user
    has_many :battles
    has_many :enemies, through: :battles
    @@prompt = TTY::Prompt.new
    @@goku_attk = ["Spirit Bomb", "Kamehameha", "Pull Hair", "Groin Kick"]
end