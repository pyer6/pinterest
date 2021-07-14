class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :caption, presence: true
  accepts_nested_attributes_for :photos
end
