FactoryGirl.define do
  factory :user do
    username 'john_doe'
    # sequence(:username) { |n| 'john_doe#{n}' }
    sequence(:email) { |n| 'john_doe#{n}@example.com'  }
    status 1
  end
end
