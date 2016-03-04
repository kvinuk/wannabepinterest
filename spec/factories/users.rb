FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email}
    name { FFaker::Name.name}
    username { FFaker::Internet.user_name}
    avatar "avatar.png"
    password "su$eppm01"
    password_confirmation "su$eppm01"
  end
end
