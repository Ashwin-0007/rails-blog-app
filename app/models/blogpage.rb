class Blogpage < ApplicationRecord
    validates :avatar, presence: true
    validates :title, presence: true
    validates :author, presence: true
    validates :content, presence: true

    has_one_attached :avatar

    belongs_to :user
    has_many :comments, dependent: :destroy
end
