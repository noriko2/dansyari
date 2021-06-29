class Post < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy

  accepts_nested_attributes_for :photo
end
