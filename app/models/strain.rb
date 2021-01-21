class Strain < ApplicationRecord
    has_many :joiners
    has_many :effects, through: :joiners
end
