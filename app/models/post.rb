class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :caption, presence: true
  accepts_nested_attributes_for :photos
end
