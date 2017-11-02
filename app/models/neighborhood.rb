class Neighborhood < ApplicationRecord
    validates :name, uniqueness: true
    validates :lat, presence: true
    validates :lng, presence: true
end
