require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do
  # Validation tests
  describe 'Validations' do

    context "All fields properly filled out" do
      it "Creates the user successfully" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.errors.full_messages).to match_array([])
      end
    end

    context "Password and confirmation do not match" do
      it "Gives an error" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "funky-tune-refridgerator"
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context "No password entered" do
      it "Gives an error" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = nil
        user.password_confirmation = nil
        user.save
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
    end

    context "Email already exists" do
      it "Gives an error" do
        user1 = User.new
        user1.first_name = "Ahsan"
        user1.last_name = "Irfan"
        user1.email = "ahsan.irfan@gmail.com"
        user1.password = "tune-funky-refridgerator"
        user1.password_confirmation = "tune-funky-refridgerator"
        user1.save

        user2 = User.new
        user2.first_name = "Ayesha"
        user2.last_name = "Ahsan"
        user2.email = "ahsan.irfan@gmail.com"
        user2.password = "horror-core-flask"
        user2.password_confirmation = "horror-core-flask"
        user2.save
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end
    end

    context "First name not entered" do
      it "Gives an error" do
        user = User.new
        user.first_name = nil
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context "Last name not entered" do
      it "Gives an error" do
        user = User.new
        user.last_name = nil
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context "Email not entered" do
      it "Gives an error" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = nil
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context "Password is less than 5 characters" do
      it "Gives an error" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "abc"
        user.password_confirmation = "abc"
        user.save
        expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end
    
  end

  # Authentication tests
  describe '.authenticate_with_credentials' do
    context "Given correct email and password" do
      it "logins in user successfully" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.authenticate_with_credentials(user.email, user.password)).to match(user)
      end
    end

    context "Given correct email and incorrect password" do
      it "does not login user" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.authenticate_with_credentials(user.email, "blahblah")).to be_nil
      end
    end

    context "Given incorrect email" do
      it "does not login user" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.authenticate_with_credentials("ahsanirfan@gmail.com", user.password)).to be_nil
      end
    end

    context "Given correct email (with spaces) and password" do
      it "logins in user successfully" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.authenticate_with_credentials(" ahsan.irfan@gmail.com ", user.password)).to match(user)
      end
    end

    context "Given correct email (with incorrect case) and password" do
      it "logins in user successfully" do
        user = User.new
        user.first_name = "Ahsan"
        user.last_name = "Irfan"
        user.email = "ahsan.irfan@gmail.com"
        user.password = "tune-funky-refridgerator"
        user.password_confirmation = "tune-funky-refridgerator"
        user.save
        expect(user.authenticate_with_credentials("Ahsan.Irfan@Gmail.com", user.password)).to match(user)
      end
    end
  end
end