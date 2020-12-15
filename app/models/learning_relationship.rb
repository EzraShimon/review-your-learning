class LearningRelationship < ApplicationRecord
  belongs_to :parent, class_name: "Learning"
  belongs_to :child, class_name: "Learning"
end
