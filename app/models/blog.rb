class Blog < ActiveRecord::Base
  belongs_to :user, polymorphic: true
end