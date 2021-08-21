require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET /posts/new' do
    let(:user_1) { create(:user) }

    before do
      sign_in user_1
      get new_post_path
    end

    context 'ログインしている時' do
      it '新規投稿ページが表示される' do
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない時' do
      it 'ログインページへリダイレクトされる' do
        sign_out user_1
        get new_post_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /posts' do
    let(:login_user) { create(:user) }
    let(:other_user) { create(:user) }
    let!(:post_1)    { create(:post, user: login_user) }
    let!(:post_2)    { create(:post, user: other_user) }

    before do
      sign_in login_user
      get posts_path
    end

    it '投稿詳細ページが表示される' do
      expect(response).to have_http_status(200)
    end

    it '自分の投稿のみ表示される (他人の投稿は、表示されない)' do
      expect(response.body).to include(post_1.photo.image.url)
      expect(response.body).not_to include(post_2.photo.image.url)
    end
  end

  describe 'DELETE /posts/:id' do
    let(:login_user) { create(:user) }
    let(:other_user) { create(:user) }
    let!(:post_1) { create(:post, user: login_user) }
    let!(:post_2) { create(:post, user: other_user) }

    before do
      sign_in login_user
    end

    it '自分の投稿は削除できる' do
      delete post_path(post_1)
      expect(response).to redirect_to(posts_path)
      follow_redirect!
      expect(response.body).to include('記録が削除されました')
    end

    it '他人の投稿は削除できない' do
      delete post_path(post_2)
      expect(response).to redirect_to(root_url)
      follow_redirect!
      expect(response.body).not_to include('記録が削除されました')
    end
  end
end
