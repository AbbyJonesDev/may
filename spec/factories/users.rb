FactoryGirl.define do

  factory :user do
    name "My Name"
    email "myname@email.com"
    password "password"
    # id "1"
    admin false
  end
end