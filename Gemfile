# frozen_string_literal: true

source "http://rubygems.org"

gemspec

group :development, :test do
  gem "autoprefixer-rails", "~> 10.4.7"
  gem "byebug",             "~> 11.1.3", platforms: %i[mri mingw x64_mingw]
  gem "capybara",           "~> 3.38.0"
  gem "kaminari",           "~> 1.2.2"
  gem "puma",               "~> 5.6.5"
  gem "rubocop",            "~> 1.45.1", require: false
  gem "selenium-webdriver", "~> 4.8.0"
  gem "sqlite3",            "~> 1.6.0"
end

group :development do
  gem "listen",       "~> 3.8.0"
  gem "web-console",  "~> 4.2.0"
end

group :test do
  gem "coveralls",                "~> 0.8.21", require: false
  gem "diffy",                    "~> 3.2.0"
  gem "equivalent-xml",           "~> 0.6.0"
  gem "mocha",                    "~> 1.3.0", require: false
  gem "rails-controller-testing", "~> 1.0.5"
end
