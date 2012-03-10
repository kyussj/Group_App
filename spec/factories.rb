FactoryGirl.define do
  factory :user do
    name     "Jack Example"
    email    "test@example.com"
    password "password"
    password_confirmation "password"
  end
end