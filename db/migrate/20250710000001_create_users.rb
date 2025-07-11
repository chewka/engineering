class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :student_id, null: false, unique: true
      t.string  :name
      t.integer :year,       null: false, default: 1
      t.boolean :active,     default: true

      t.timestamps
    end
    add_index :users, :student_id, unique: true
  end
end
