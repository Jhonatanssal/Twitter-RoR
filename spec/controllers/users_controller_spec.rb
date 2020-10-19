require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  User.delete_all

  let!(:valid_user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:invalid_user) { User.create(username: nil, fullname: nil) }

  describe '#create' do
    context 'Valid user' do
      it 'checks if the user can be created' do
        expect(valid_user).to be_valid
      end

      it 'creates the user if valid' do
        expect { User.create(username: 'Test1', fullname: 'Testing1') }.to change(User, :count).by(+1)
      end

      it 'checks if the user can be created' do
        expect(response).to have_http_status(:ok)
      end

      it 'does not create the user if invalid' do
        expect { User.create(username: nil, fullname: nil) }.not_to change(User, :count)
      end
    end

    context 'Invalid user' do
      it 'checks if the user cannot be created' do
        expect(invalid_user).to be_invalid
      end
    end
  end

  describe '#destroy' do
    it 'removes the user if exists' do
      expect { valid_user.delete }.to change(User, :count).by(-1)
    end

    it 'does not remove the user if it does not exists' do
      expect { invalid_user.delete }.not_to change(User, :count)
    end
  end

  describe '#update' do
    it 'updates the user if exists' do
      invalid_user.update(username: 'success test', fullname: 'success')
      expect(invalid_user).to be_valid
    end

    it 'it does not update the user if it does not exists' do
      valid_user.update(username: nil, fullname: 'success')
      expect(invalid_user).to be_invalid
    end
  end
end
