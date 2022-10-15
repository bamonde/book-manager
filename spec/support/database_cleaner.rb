require 'database_cleaner/active_record'

DatabaseCleaner.url_allowlist = ['postgres://postgres:postgres@db:5432']

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
