class Board < ApplicationRecord
  belongs_to :category
  mount_uploader :picture, PictureUploader
  validates :name, presence: true



end
