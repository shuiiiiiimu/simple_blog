class Topic < ActiveRecord::Base

  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }

  validates_presence_of :content, :title
  validates :content, presence: true

end
