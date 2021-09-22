require 'faker'

FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    start_date { DateTime.now }
    finish_date { DateTime.now + 1.year }
    icon { 'alert' }
    trait :is_important do
      is_important { true }
    end
    trait :is_not_important do
      is_important { false }
    end
    user
  end
end
