class Learning < ApplicationRecord
  belongs_to :user
  has_one :parent_relationship, class_name: "LearningRelationship", foreign_key: "child_id", dependent: :destroy
  has_one :parent, through: :parent_relationship, foreign_key: "child_id"
  has_many :child_relationships, class_name: "LearningRelationship", foreign_key: "parent_id", dependent: :destroy
  has_many :children, through: :child_relationships, foreign_key: "parent_id", dependent: :destroy
end
