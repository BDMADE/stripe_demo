FactoryGirl.define do
  factory :user do
    email 'example@stripe.com'
    sign_in_count 2
    first_name 'Tanbir'
    last_name 'Hasan'
    provider 'facebook'
    uid 'f0md4nld0d'
    password 'abc123'
  end
end
