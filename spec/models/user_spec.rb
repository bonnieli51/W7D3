require 'rails_helper'

RSpec.describe User, type: :model do

  let(:incomplete_user){
      User.new(
        username: "nilly", 
        password: "petersucks"
      )
  }

  it { should validate_presence_of(:username)}  
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "password encryption" do
    it "does not save password to the DB" do
      User.create!(username: 'bonnie_li', password: 'password')
      bonnie = User.find_by(username: 'bonnie_li')
      expect(bonnie.password).not_to be('password')
    end

    context 'saves password properly' do
      it 'encrpyts the password ' do
        expect(BCrypt::Password).to receive(:create)
        User.new(username: 'abcde', password: '123456')
      end
    end


  end

  
end
