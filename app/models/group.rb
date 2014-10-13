# Public: This is a description of the group table and how it relates to
#   the other tables.

class Group < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :rosters, dependent: :destroy
  has_many :users, through: :rosters
  belongs_to :user
  belongs_to :course
  
  # PubliC: Check to see if a user is the same as the group's owner.
  # user_check - the user to be tested against the group owner.
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
  
  # Public: check to see if a course is the same as the course a group
  #   belongs to.
  # course_check -  the course to be tested against the course that the
  #                 group belongs to.
  scope :course_is, ->(course_check) {where ("course_id = ?", user_check) }
end
