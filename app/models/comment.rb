class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :blogpage
   belongs_to :parent, class_name: "Comment", optional: true
   has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

   validates :content, presence:true
    
   # after_create_commit {broadcast_to_blogpage}

   #  private

   #  def broadcast_to_blogpage
   #    blogpage_name = "blogpage #{blogpage.id}"
   #    broadcast_prepend_to blogpage_name,
   #                               target: 'comments',
   #                               partial: 'comments/comment',
   #                               locals: {comment: self}

   #  end   
end
