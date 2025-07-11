class CreateLessonStandards < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_standards do |t|
      t.references :lesson,        null: false, foreign_key: true
      t.string     :standard_code, null: false

      t.timestamps
    end
    add_foreign_key :lesson_standards, :standards,
                    column: :standard_code,
                    primary_key: :code
  end
end
