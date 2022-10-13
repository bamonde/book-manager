source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "devise" # Authentication and Authorization
gem "awesome_print"
gem 'bootstrap', '~> 5.2', '>= 5.2.1'
gem "sassc-rails" # Use Sass to process CSS

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ] # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'faker'
end

group :development do
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "rack-mini-profiler" # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "spring" # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 5.0"
  gem "rails-controller-testing"
  gem "rspec-collection_matchers"
end
