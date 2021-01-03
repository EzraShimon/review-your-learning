class AddLearnedOnToLearnings < ActiveRecord::Migration[6.0]
  def change
    add_column :learnings, :learned_on, :date
  end
end
