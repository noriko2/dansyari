class Post < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy
  accepts_nested_attributes_for :photo

  validates :caption, length: { maximum: 300 }
  validates :photo, presence: true
end
