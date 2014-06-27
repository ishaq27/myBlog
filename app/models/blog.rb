class Blog < ActiveRecord::Base

validates :user_id, :presence => true
validates :user_type, :presence => true


  belongs_to :user
  has_many :comments
end
