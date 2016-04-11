FactoryGirl.define do
  factory :tag do
    name {FFaker::CheesyLingo.word}
    color {FFaker::Color.name}
    board
  end
end
