require 'rails_helper'

RSpec.feature "User login", type: :feature, js: true do

  before :each do
  @user = User.create! first_name: "Ayesha", last_name: "Ahsan", email: 'aa112233@gmail.com.com', password: "ayesha", password_confirmation: "ayesha"
  end
  
  
  scenario "Successful user authentication with correct login information" do
    
    visit root_path
    click_on('Login')
    sleep 1
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Login'
    sleep 1
    save_screenshot
    expect(page).to have_content 'Logout'

  end

end