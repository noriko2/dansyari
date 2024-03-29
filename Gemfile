source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rails-i18n', '~> 6.0.0'

# ログイン機能
gem 'devise'
gem 'omniauth'
gem 'omniauth-line'
gem 'omniauth-facebook'

# gem "OmniAuth" の脆弱性対策 (OmniAuth::AuthenticityErrorの対策)
gem 'omniauth-rails_csrf_protection'

# 環境変数
gem 'dotenv-rails'

# ファイルのアップロード
gem 'carrierwave'

# 画像処理
gem 'image_processing'
gem 'mini_magick'

# ページネーション
gem 'kaminari'

# 本番環境でAWSのs3(クラウドストレージ)を使えるようにする
gem 'fog-aws'

# Sprockets4.0だと、app/assetsディレクトリを削除するとSprockets::Railtie::ManifestNeededErrorが発生する
gem 'sprockets', '~> 3.7.2'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # コード修正
  gem 'rubocop-airbnb'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time
  # and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # test
  gem "rspec-rails"
  gem "factory_bot_rails"
  # Adds support for Capybara system testing
  gem 'capybara'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # A browser automation framework and ecosystem
  gem 'selenium-webdriver'
end

group :production do
  # 本番環境ではPostgresqlを使用
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
