class Quarter < ApplicationRecord
  has_many :lessons, dependent: :destroy
end
