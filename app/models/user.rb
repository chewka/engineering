class User < ApplicationRecord
  has_many :formative_assignment_completions, dependent: :destroy
  has_many :summative_assignment_completions, dependent: :destroy
  has_many :quiz_grades, dependent: :destroy
end
