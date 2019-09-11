FactoryBot.define do
  factory :client do
    sequence :email do |n|
      "#{n}_#{FFaker::Internet.email}"
    end
    password 'password'
    name FFaker::Name.first_name + FFaker::Name.last_name
    phone_number '555123123'
    eula 'accept'
  end
end
