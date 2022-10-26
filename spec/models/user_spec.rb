require 'rails_helper'

RSpec.describe User, type: :model do

  let(:incomplete_user){
      User.new(
        username: "", 
        email: "abc@gmail.com",
        password: "petersucks"
      )
  }

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:email)}  
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}



end
