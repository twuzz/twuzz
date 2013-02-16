FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "bluth#{n}@example.com" }
    password_digest '$2a$10$6vYtqtCeo2FygLcCZyzjTOkekglKq1frMDtQ2khD4HJj0AGXoNtbW' # babybuster
    first_name 'Lucile'
    last_name 'Bluth'
  end
end
