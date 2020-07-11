# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@duetcode.io" }
    password { 'samplepassword' }
  end
end
