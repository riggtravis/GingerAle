class Group < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :rosters, dependent: :destroy
  has_many :users, through: :rosters
  belongs_to :user
  belongs_to :course
  
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
  scope :course_is, ->(course_check) {where ("course_id = ?", user_check) }
end
