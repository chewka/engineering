class CreateFormativeAssignmentCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :formative_assignment_completions do |t|
      # no default index, we’ll add a custom one below
      t.references :formative_assignment,
                   null: false,
                   foreign_key: true,
                   index: false

      t.references :user, null: false, foreign_key: true
      t.boolean    :completed, default: false

      t.timestamps
    end

    # custom, shorter index name
    add_index :formative_assignment_completions,
              :formative_assignment_id,
              name: "idx_facomps_on_fa_id"
  end
end
