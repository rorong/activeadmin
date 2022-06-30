FactoryGirl.define do
  factory :product do
    name "My Amazing IN"
    description "Jon Snow"
    labels_limits 2
    carriers_limit 30
    started_at Faker::Date.forward(days: 23)
    expired_at Date.today + 10
    status "active"
  end
end