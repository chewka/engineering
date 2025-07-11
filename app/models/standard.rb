class Standard < ApplicationRecord
  self.primary_key = 'code'

  has_many :lesson_standards,
           foreign_key: :standard_code,
           primary_key: :code,
           dependent: :destroy

  has_many :lessons, through: :lesson_standards
end
