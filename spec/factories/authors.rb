FactoryBot.define do
  factory :author do
    name { Faker::JapaneseMedia::SwordArtOnline.real_name }
  end
end
