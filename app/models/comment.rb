class Comment < ApplicationRecord
  belongs_to :board
  validates :name, presence: true
  validates :content, presence: true
end
