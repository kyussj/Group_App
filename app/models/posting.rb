class Posting < ActiveRecord::Base
#Coded by Paul, Jack and Nabi
 attr_accessible :content
 
 validates :user_id, presence: true
 
 belongs_to :user
 
  validates :content, presence: true, length: { maximum: 180 }
  validates :user_id, presence: true
  
  default_scope order: 'postings.created_at DESC'
  
    scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private
  
    def self.followed_by(user)
      followed_user_ids = %(SELECT followed_id FROM relationships
                            WHERE follower_id = :user_id)
      where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
            { user_id: user })
    end
end