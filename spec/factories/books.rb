FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    release_date { (1..36).to_a.sample.months.ago }
    edition { 1 }
    genre { Faker::Book.genre }
    isbn { Faker::Number.number(digits: 10) }
    iccn { Faker::Number.number(digits: 4) }
    oclc { Faker::Number.number(digits: 8) }
    publisher { FactoryBot.create(:publisher) }
  end
end
