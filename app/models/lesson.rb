class Lesson < ApplicationRecord
  belongs_to :quarter

  has_many :lesson_standards, dependent: :destroy
  has_many :standards, through: :lesson_standards

  has_many :formative_assignments, dependent: :destroy
  has_many :summative_assignments, dependent: :destroy
  has_many :quizzes, dependent: :destroy
end
