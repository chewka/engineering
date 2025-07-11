class SummativeAssignment < ApplicationRecord
  belongs_to :lesson
  has_many   :summative_assignment_completions, dependent: :destroy
end
