# frozen_string_literal: true

FactoryBot.define do
  factory :phone_number do
    number { 'MyString' }
    contact { nil }
  end
end
