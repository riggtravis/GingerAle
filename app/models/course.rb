# Public: This is the description of the course table and how it
#   relates to the other tables.

class Course < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :users
  belongs_to :user
  
  # Public: This checks to see if the user that owns the course is the
  #   same as another user.
  # user_check - the user to be tested against the owner.
  # Create a scope that checks the user.
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
end
