require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  describe 'GET /users/:id' do
    before do
      sign_in user_1
      get user_path(user_1)
    end

    context 'ユーザーがログインしている場合' do
      it 'マイページが表示される' do
        expect(response).to have_http_status(200)
      end

      it 'ログインユーザーの名前が表示される' do
        expect(response.body).to include "#{user_1.user_name}"
      end

      it '他のユーザーの名前は、表示されない' do
        expect(response.body).not_to include "#{user_2.user_name}"
      end

      it '他のユーザーのプロフィールページは見れない' do
        get user_path(user_2)
        expect(response).to redirect_to(root_url)
      end
    end

    context 'ユーザーがログインしていない場合' do
      it 'ログイン画面にリダイレクトされる' do
        sign_out user_1
        get user_path(user_1)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /users/edit' do
    before do
      sign_in user_1
      get edit_user_registration_path
    end

    it 'ユーザー編集ページが表示される' do
      expect(response).to have_http_status(200)
    end
  end
end
