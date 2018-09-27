FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString@example.com" }
    password {"foobar"}
    password_confirmation {"foobar"}
  end
end
