require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "ユーザー名、メールアドレス、パスワードがあれば登録できる" do
    expect(@user).to be_valid
  end

  it "ユーザー名がないと登録できない" do
    user = FactoryBot.build(:user, user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include("を入力してください")
  end

  it "メールアドレスがないと登録できない" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "メールアドレスが重複していると登録できない" do
    user = FactoryBot.build(:user, email: @user.email)
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードが暗号化されている" do
    expect(@user.encrypted_password).not_to eq 'password'
  end
end
