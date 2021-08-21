FactoryBot.define do
  factory :post do
    caption { 'テスト投稿文' }
    association :user
    after(:build) do |post|
      post.photo = FactoryBot.build(:photo, post: post)
      # post.photo = FactoryBot.build(:photo)でも可
    end
  end

  factory :photo do
    image do
      Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/test_1.png'))
    end
  end
end
