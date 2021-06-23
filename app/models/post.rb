class Post < ApplicationRecord
  belongs_to :user
  has_one :photos, dependent: :destroy
end
