require 'rails_helper'

describe User do
 # user = FactoryGirl.create :user
  
  #it { should validate_presence_of :email } inline sample
  
  it "check presence of email" do  # block sample
    should validate_presence_of :email
  end
  
  it "check presence of username" do  #same for username checking precense
    should validate_presence_of :username
  end

  it "check valid username and email" do  #this can be done by be_valid also which wil check all rules defined in model file.
   user = User.new(email: 'akki209@example.com', username: 'akki209')
   expect(user).to be_valid
  end
  
  
  it "check email to be valid" do  # checking email can't be blank
   user = User.new(email: nil)
   user.valid?
   expect(user.errors[:email]).to include("can't be blank")
  end
  
  it "check email to be valid with factory" do  # checking email can't be blank
   user = FactoryGirl.create(:user, email: nil)  #overridding factory emails
   expect(user).to be_valid
  end
  
  it "check email to be valid" do 
   user = User.new(username: nil)
   user.valid?
   expect(user.errors[:username]).to include("can't be blank")
  end
  
  
  it "check username is not duplicate" do   #checking for multiple users and checking uniqueness
   User.create(username: "akki209", email: "akki209@example.com")
   user = User.new(username: "akki209" , email: "arpan209@example.com")
   user.valid?
   expect(user.errors[:username]).to include("has already been taken")
  end
  
  it "check email is not duplicate" do    #same for email
   User.create(username: "akki209", email: "akki209@example.com")
   user = User.new(username: "arpan209" , email: "akki209@example.com")
   user.valid?
   expect(user.errors[:email]).to include("has already been taken")
  end
  
  
  it "check email is not duplicate with factory" do #with factory
   
   FactoryGirl.create(:user)
   user = FactoryGirl.create(:user)
   user.valid?
   expect(user.errors[:email]).not_to include("has already been taken")
  end
  
  
  it "email should be valid via regex" do  #regex example
   
   user = User.new(username: "akash2091" , email: "email@example.com")
   user.valid?
   expect(user.email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
   
  end
  
  
  it "check user authentication" do
    user = User.create(username: "akki209", email: "akki209@example.com", encrypted_password: "asas")
    #User.checkuser('akki209','asas').should be_nil
    expect(User.checkuser('akki209','asas')).to eq(1)
  end
 
=begin  
  
  it "should be invalid without a email" do
    FactoryGirl.build(:user, email: nil)
    should_not be_valid
  end
=end
  
end
