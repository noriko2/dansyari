require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let(:login_user) { create(:user) }
  let!(:post) { create(:post, user: login_user) }

  before do
    log_in_as(login_user)
    visit posts_path
  end

  describe 'modal' do
    it '記録一覧ページの写真をクリックするとモーダルが表示される' do
      first('div.image-item a img').click
      expect(page).to have_css('.modal-post')
      expect(page).to have_css('.modal-image')
      expect(page).to have_content('テスト投稿文')
      expect(page).to have_link('削除')
    end

    it 'モーダル内の削除をクリックすると、記録が削除される' do
      first('div.image-item a img').click
      # 削除リンクをクリックし、alertのconfirm（OK）ボタンを押す
      page.accept_confirm do
        click_link("削除")
      end
      expect(page).to have_content('記録が削除されました')
      expect(page).to have_content('断捨離記録は、まだないよ')
      expect(page).not_to have_css('.modal-post')
    end
  end
end
