require 'faker'

FactoryBot.define do
  
  factory :user do
    id {Faker::Number.number(digits: 2)}
    firstName {Faker::Name.first_name}
    lastName {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    idFile {Rack::Test::UploadedFile.new('spec/fixtures/files/avatar.png', 'image/png') }
  end

  factory :need do
    id {Faker::Number.unique.number(digits: 3)}
    userID {Faker::Number.number(digits: 3)}
    title {Faker::Lorem.sentence(word_count: 3)}
    description {Faker::Lorem.characters(number: 200)}
    needType {"material"}
    lat {Faker::Number.decimal(l_digits: 2)}
    lng {Faker::Number.decimal(l_digits: 2)}
    formattedAddress {Faker::Address.full_address}
    status {"open"}
  end

  factory :fulfillment do
    id {Faker::Number.unique.number(digits: 2)}
    helperID {Faker::Number.number}
    needID {Faker::Number.number}
  end

  factory :conversation do
    id {Faker::Number.unique.number(digits: 2)}
    fulfillmentID {Faker::Number.number(digits: 2)}
  end

  factory :message do
    id {Faker::Number.unique.number(digits: 2)}
    conversationID {Faker::Number.number(digits: 2)}
    senderID {Faker::Number.number(digits: 2)}
    content {Faker::Lorem.characters(number: 100)}
  end

end
