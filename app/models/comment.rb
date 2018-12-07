# Comment
class Comment < ApplicationRecord
  belongs_to :note
  validates :content, presence: true, length: { minimum: 2 }
end
