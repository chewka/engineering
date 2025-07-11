class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :quarter,        null: false, foreign_key: true
      t.string     :name
      t.integer    :lesson_number
      t.text       :essential_question
      t.text       :learning_intention
      t.text       :content
      t.string     :link

      t.timestamps
    end
  end
end
