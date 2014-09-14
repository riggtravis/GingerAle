class Course < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :users
  belongs_to :user
  
  # Create a scope that checks the user.
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
end
