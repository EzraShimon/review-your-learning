class CreateLearnings < ActiveRecord::Migration[6.0]
  def change
    create_table :learnings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
