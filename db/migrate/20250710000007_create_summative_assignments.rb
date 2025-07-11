class CreateSummativeAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :summative_assignments do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string     :name
      t.text       :content
      t.integer    :points

      t.timestamps
    end
  end
end
