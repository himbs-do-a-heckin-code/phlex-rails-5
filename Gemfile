# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'phlex', git: 'https://github.com/himbs-do-a-heckin-code/phlex_ruby2.7', branch: 'main'

gem 'rails', '~> 5.1.0'

group :development do
	gem "rubocop"
end

group :test do
  gem 'rspec-rails', '~> 3.5'
end

gem 'byebug'