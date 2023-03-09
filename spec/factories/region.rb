# frozen_string_literal: true

FactoryBot.define do
  factory :region do
    name { 'RegionName' }
    id { 1 }
    # sequence(:id) { |n| n }
    # sequence(:id) { |n| "#{n}" }
  end
end
