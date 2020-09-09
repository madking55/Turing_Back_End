require 'rails_helper'

RSpec.describe "Logging Out" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"
    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(page).to have_content('Log out')

    click_on "Log out"

    expect(current_path).to eq('/')
    expect(page).to have_content("I already have an account")
  end
end