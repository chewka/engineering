class LessonStandard < ApplicationRecord
  belongs_to :lesson
  belongs_to :standard,
             foreign_key: :standard_code,
             primary_key: :code
end
