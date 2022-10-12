FactoryBot.define do
  factory :publisher do
    name { [ Faker::Book.publisher, Faker::Company.suffix ].join(' ') }
  end
end
