class CreateLearningRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_relationships do |t|
      t.references :parent, foreign_key: { to_table: :learnings }
      t.references :child, foreign_key: { to_table: :learnings }
      
      t.timestamps
    end
  end
end
