# Public: This is the description of the rating table and how it relates
#   to the other tables.

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  
  # Public: A function to test if a user is the same as the
  #   rating's owner.
  # user_check - The user that is to be tested against the rating's owner
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
  
  # Public: A function to test if a group is the same as the group that
  #   the rating's owner was working in.
  # group_check - The group that is being tested against the group that
  #   the rating's owner was working in.
  scope :group_is, ->(group_check) { where ("group_id = ?", group_check) }
end
