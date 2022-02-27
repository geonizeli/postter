source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"
gem "rails", "~> 7.0.2", ">= 7.0.2.2"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder"

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem "rspec-rails", "~> 5.1"
  gem "factory_bot_rails", "~> 6.2"
end

gem "faker", "~> 2.19"
