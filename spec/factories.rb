FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "password"

    factory :admin do
      admin true
    end
  end

  factory :posting do
    content "Bob is Awesome!"
    user
  end
end

#Coded by Jack