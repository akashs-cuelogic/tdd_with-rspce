FactoryGirl.define do
  
   sequence :username do |n|
     "jane_doe#{n}"
   end
   
  factory :user do
    #username 'john_doe'
    username
    email "#{username}@example.com"
    
  end

end
