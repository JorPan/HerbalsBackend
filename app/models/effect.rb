class Effect < ApplicationRecord
    has_many :joiners
    has_many :strains, through: :joiners
end
