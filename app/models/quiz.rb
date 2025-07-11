class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many   :quiz_grades, dependent: :destroy
end
