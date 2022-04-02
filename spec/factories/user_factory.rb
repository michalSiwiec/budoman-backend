# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'janusz123@gmail.com' }
    password  { 'qwebjbH5586' }
    avatars { [{ main: true, storage_path: 'path_to_avatar' }, { main: false, storage_path: 'path_to_avatar2' }] }

    trait :incorrect_email do
      email { 'janusz123gmail.com' }
    end

    trait :incorrect_password do
      password { 'a7hzG' }
    end

    trait :additional_fileds_in_avatar do
      avatars { [{ main: true, storage_path: 'path_to_avatar1', active: true }] }
    end

    trait :missing_fields_in_avatars do
      avatars { [{ main: true }, { main: false, storage_path: 'path_to_avatar' }] }
    end

    trait :incorrect_avatar_types do
      avatars { [{ main: 'asdsa', storage_path: 'path_to_avatar' }] }
    end
  end
end
