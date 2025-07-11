class FormativeAssignment < ApplicationRecord
  belongs_to :lesson
  has_many   :formative_assignment_completions, dependent: :destroy
end
