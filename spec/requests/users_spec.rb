require 'rails_helper'

RSpec.describe "Users", type: :request do
  subject (:bulbasaur) {User.create!(username: 'bulbasaur', password: '123456')}
  let(:charmander) {User.create!(username: 'charmander', password: '123456')}

  describe 'GET /users/new(#new)' do
    it 'renders the "Sign Up" form' do
      get new_user_url
      expect(response.body).to include("Sign Up")
      expect(response.body).not_to include("Sign In")
      expect(response.body).not_to include("All Users")
    end
  end

end
