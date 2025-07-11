class CreateStandards < ActiveRecord::Migration[7.0]
  def change
    create_table :standards, id: false do |t|
      t.string :code,        primary_key: true
      t.string :description
      t.string :level

      t.timestamps
    end
  end
end
