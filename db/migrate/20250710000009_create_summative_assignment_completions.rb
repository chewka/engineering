class CreateSummativeAssignmentCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :summative_assignment_completions do |t|
      # disable the default, auto-generated index
      t.references :summative_assignment,
                   null: false,
                   foreign_key: true,
                   index: false

      t.references :user,
                   null: false,
                   foreign_key: true
      t.boolean    :completed, default: false

      t.timestamps
    end

    # add a shorter custom index name
    add_index :summative_assignment_completions,
              :summative_assignment_id,
              name: "idx_sacoms_on_sa_id"
  end
end
