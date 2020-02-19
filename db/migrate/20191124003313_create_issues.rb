class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :expected_output
      t.string :actual_output
      t.string :status
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
