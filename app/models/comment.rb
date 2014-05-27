class Comment < ActiveRecord::Base

 belongs_to :user, dependent: :destroy
 belongs_to :topic, dependent: :destroy

 validates_presence_of :content, :user_id, :topic_id

end
