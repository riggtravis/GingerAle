# Public: This is the description of the
#   user table and how it relates to the
#   other tables.

class User < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :rosters, dependent: :destroy
  has_many :groups, :through :rosters
end
