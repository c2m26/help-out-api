require 'faker'

FactoryBot.define do

  # factory :user do
  #   id {"1"}
  #   firstName {"Joe"}
  #   lastName {"Doe"}
  #   email {"jdoe@mail.com"}
  #   password {"asd"}
  # end

  # factory :need do
  #   id {"1"}
  #   userID {"1"}
  #   title {"Title"}
  #   description {"Description"}
  #   needType {"material"}
  #   lat {"50"}
  #   lng {"10"}
  #   formattedAddress {"Address"}
  #   status {"open"}
  # end
  
  factory :user do
    id {Faker::Number.number}
    firstName {Faker::Name.first_name}
    lastName {Faker::Name.last_name}
    email {Faker::Internet.email }
    password {Faker::Internet.password}
    
  end

  factory :need do
    id {Faker::Number.unique.number}
    userID {Faker::Number.digit}
    title {Faker::Lorem.sentence(word_count: 3)}
    description {Faker::Lorem.characters(number: 200)}
    needType {"material"}
    lat {Faker::Number.digit}
    lng {Faker::Number.digit}
    formattedAddress {Faker::Address.full_address}
    status {"open"}
  end

end
