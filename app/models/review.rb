class Review < ActiveRecord::Base
  attr_accessible :content, :reviewer_id, :category

  belongs_to :user
  belongs_to :reviewer, :class_name => "User"

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'reviews.created_at DESC'
end

