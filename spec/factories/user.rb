FactoryBot.define do
    factory :user do
      # name {"UserName"}
      email {"email@email.com"}
      password { 'password' }
      # password_confirmation { 'password' }

      before(:build_stubbed) { |user| user.skip_confirmation! }
    end

    trait :admin do 
      role { 'admin' }
    end

    trait :guest do
      role { ''}
    end
  end
