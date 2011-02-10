# == Schema Information
# Schema version: 20110103070454
#
# Table name: reviews
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  category    :string(255)
#  user_id     :integer
#  reviewer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Review < ActiveRecord::Base
  attr_accessible :content, :reviewer_id, :category

  belongs_to :user
  belongs_to :reviewer, :class_name => "User"

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'reviews.created_at DESC'
end

