source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.rc2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem "non-stupid-digest-assets"
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# 服务器
gem 'passenger'

# Store
gem 'mysql2'
# gem 'hiredis'
# gem 'redis'
# gem 'redis-objects'
# gem 'redis-namespace'

# Utils
# gem 'sidekiq'
gem 'jwt'
gem 'httparty'

# Third Part
gem 'kaminari', github: 'amatsuda/kaminari'
gem 'simple_form'
gem 'default_form', github: 'qinmingyuan/default_form', tag: 'v1.3'
# 权限控制
gem 'devise'#, git: 'https://github.com/plataformatec/devise.git'
gem 'cancancan'
gem 'rolify'
# 全文检索
# gem 'elasticsearch'
# gem 'elasticsearch-model'
# gem 'elasticsearch-rails'
gem 'spreadsheet'
gem 'roo', require: false
# gem 'axlsx', require: false
# 生成pdf
# gem 'prawn'
# gem 'prawn-table'

#gem 'bootstrap-sass', '~> 3.3.6'
#gem "cells-rails"
# 定时任务
gem 'rufus-scheduler'
#gem 'whenever', :require => false
# 文件上传
gem 'carrierwave'
gem 'remotipart', '~> 1.2'
# 二维码
# gem 'barby'
# SEO优化
# gem 'meta-tags'
# 图片mongo保存
# gem 'mongo'
# gem 'asset_sync'
# 在线支付
# gem 'alipay', '~> 0.12.0'
# gem 'rqrcode'
# gem 'wx_pay'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
end

# 部署
group :development do
  gem 'mina' # 暂时先用mina
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

