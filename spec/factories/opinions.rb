FactoryBot.define do
  factory :opinion do
    content { "MyText" }
    mark { 1 }
    user { nil }
  end
end
