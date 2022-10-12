FactoryBot.define do
  factory :publisher do
    name { [Faker::Company.name, Faker::Company.suffix].join(' ') }
  end
end
