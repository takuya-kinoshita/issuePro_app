class Board < ApplicationRecord
  belongs_to :category
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :title, presence: true
  validates :body, presence: true
  #validates :responsible, presence: true
  #validates :deadline, presence: true



end
