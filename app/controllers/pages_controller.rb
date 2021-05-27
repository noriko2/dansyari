class PagesController < ApplicationController
  def home
    @items = ['服', '靴', 'バッグ', '本・雑誌', '食器', '化粧品']
  end
end
