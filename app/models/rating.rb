class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  
  scope :user_is, ->(user_check) { where ("user_id = ?", user_check) }
  scope :group_is, ->(group_check) { where ("group_id = ?", group_check) }
end
