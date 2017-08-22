class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  validates :tag_list, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  acts_as_taggable
end
