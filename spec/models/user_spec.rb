require 'rails_helper'

RSpec.describe User do
  describe 'model validation' do
    context 'successful' do
      it 'saves user to DB' do
        expect { create(:user) }.to change { described_class.count }.from(0).to(1)
      end
    end

    context 'unsuccessful' do
      let(:validation_error_class) { ActiveRecord::RecordInvalid }

      context 'email' do
        let(:taken_msg) do
          /Email is already taken!/
        end

         let(:incorrect_format_msg) do
          /Email has incorrect format!/
         end

        it 'raise email is already taken' do
          create(:user)

          expect do
            create(:user)
          end.to raise_error(validation_error_class, taken_msg)
        end
  
        it 'raise email has uncorrect format' do
          expect do
            create(:user, :incorrect_email)
          end.to raise_error(validation_error_class, incorrect_format_msg)
        end
      end

      context 'password' do
        let(:incorrect_format_msg) do
          /must be at least 6 characters and include one number and one letter./
        end

        it 'raise password has uncorred format' do
          expect do
            create(:user, :incorrect_password)
          end.to raise_error(validation_error_class, incorrect_format_msg)
        end
      end

      context 'avatars' do
        let(:additional_fields_msg) do
          /should have fields/
        end

        let(:incorrect_types_msg) do
          /main should be Boolean, storage_path should be String but got/
        end

        it 'raise incorrect fields when aditional keys are added' do
          expect do
            create(:user, :additional_fileds_in_avatar)
          end.to raise_error(validation_error_class, additional_fields_msg)
        end

        it 'raise incorrect fileds when demand key in missing' do
          expect do
            create(:user, :missing_fields_in_avatars)
          end.to raise_error(validation_error_class, additional_fields_msg)
        end

        it 'raise incorrect fileds types when has incorrect types' do
          expect do
            create(:user, :incorrect_avatar_types)
          end.to raise_error(validation_error_class, incorrect_types_msg)
        end
      end
    end
  end
end
