require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "User Validations" do
    it "requires first_name field to be filled in" do
     @user = User.new(:first_name => nil, :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
     @user.save
     expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "requires last_name field to be filled in" do
    @user = User.new(:first_name => "Kirsten", :last_name => nil, :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
    @user.save
    expect(@user.errors.full_messages).to include("Last name can't be blank")
 end

 it "requires email field to be filled in" do
  @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => nil, :password => "123456", :password_confirmation => "123456")
  @user.save
  expect(@user.errors.full_messages).to include("Email can't be blank")
end

it "requires password field to be filled in" do
 @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => nil, :password_confirmation => "123456")
  @user.save
  expect(@user.errors.full_messages).to include("Password can't be blank")
end

it "requires password confirmation field to be filled in" do
  @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => nil)
   @user.save
   expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
 end

 it "requires password confirmation field to match password" do
  @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "654321")
   @user.save
   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
 end

 it "should not allow registration with an email that already exists and be case insensitive" do
  @user1 = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
  @user1.save
  @user2 = User.new(:first_name => "Amy", :last_name => "Sudbury", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
  @user2.save
  expect(@user2).to_not be_valid
 end


 it "requires minimun length of password" do
  @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123", :password_confirmation => "123")
   @user.save
   expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
 end

end

describe ' authenticate with credentials class method' do
  it "should remove trailing whitespace when logging in" do
    @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
    @user.save
    authUser = User.authenticate_with_credentials(" k@k.com ", "123456")
    expect(authUser.email).to eql("k@k.com")
  end

  it "should convert cases when authenticating" do
    @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
    @user.save
    authUser = User.authenticate_with_credentials(" K@K.COM ", "123456")
    expect(authUser.email).to eql("k@k.com")
  end

  it "should not authenticate if the password is incorrect, even if email has whitespaces" do
    @user = User.new(:first_name => "Kirsten", :last_name => "Hammond", :email => "k@k.com", :password => "123456", :password_confirmation => "123456")
    @user.save
    authUser = User.authenticate_with_credentials(" K@K.com ", "654321")
    expect(authUser).to eql(nil)
  end
end

end
