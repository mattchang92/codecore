FactoryGirl.define do
  factory :idea do
    title "Non-unique title"
    description {Faker::ChuckNorris.fact}
  end
end
