class CreateQuarters < ActiveRecord::Migration[7.0]
  def change
    create_table :quarters do |t|
      t.integer :year,            null: false
      t.integer :quarter_number,  null: false
      t.integer :semester_number, null: false

      t.timestamps
    end
  end
end
