class CreateQuizGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_grades do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer    :score

      t.timestamps
    end
  end
end
