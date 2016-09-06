FactoryGirl.define do
  factory :comment do
    association :user, factory: :user
    association :idea, factory: :idea
    body "Hello world"
  end
end
