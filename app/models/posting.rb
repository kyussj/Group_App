class Posting < ActiveRecord::Base
 attr_accessible :content
 
 validates :user_id, presence: true
 
 belongs_to :user
 
  validates :content, presence: true, length: { maximum: 180 }
  validates :user_id, presence: true
  
  default_scope order: 'postings.created_at DESC'
end
