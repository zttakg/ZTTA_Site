FactoryBot.define do
  factory :detail do
    name FFaker::Name.first_name
    count 1
    width 300.0
    height 300.0
    cut_length 1200.0
    area 90000.0
    mass 90.0
    holes_count 0
    price 0.19376e5
  end
end
