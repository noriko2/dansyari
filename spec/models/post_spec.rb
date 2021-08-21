require 'rails_helper'

RSpec.describe Post, type: :model do
  it "画像がないと登録できない" do
    post = FactoryBot.build(:post)
    post.photo = nil
    expect(post).not_to be_valid
  end

  it "画像とcaptionがあれば登録できる" do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  it "画像があれば、captionがなくても登録できる" do
    post = FactoryBot.build(:post, caption: nil)
    expect(post).to be_valid
  end

  it "captionが300文字を越えると登録できない" do
    post = FactoryBot.build(:post, caption: "a" * 301)
    expect(post).not_to be_valid
  end
end
