FactoryBot.define do
  factory :publisher do
    name { [ Faker::Book.publisher, (1..100).to_a.sample, Faker::Company.suffix ].join(' ') }
  end
end
