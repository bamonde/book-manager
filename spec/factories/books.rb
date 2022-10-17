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
    author_ids { FactoryBot.create_list(:author, 2).map(&:id) }

    after(:build) do |book|
      book.cover.attach(
        io: File.open(Rails.root.join('spec', 'support', 'files', 'book-cover.jpg')),
        filename: 'book-cover.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
