class AddLastReviewedOnToLearnings < ActiveRecord::Migration[6.0]
  def change
    add_column :learnings, :last_reviewed_on, :date
  end
end
