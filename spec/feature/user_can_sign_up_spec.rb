require 'rails_helper'

RSpec.describe 'User creates account' do
  include Capybara::DSL
  context 'user can sign up' do
    it 'user puts in correct info' do
      visit '/'
      click_on 'Sign Up'
      fill_in 'First name', with: 'Taylor'
      fill_in 'Last name', with: 'Moore'
      fill_in 'Email', with: 'Taylor@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq '/deals'
      expect(User.count).to eq 1
      expect(page).to have_content 'Taylor Moore'
    end

    it 'user puts incorrect info' do
      visit '/'
      click_on 'Sign Up'
      fill_in 'First name', with: 'Taylor'
      fill_in 'Last name', with: 'Moore'
      fill_in 'Email', with: 'Taylor@gmail.com'
      fill_in 'Password', with: 'something'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq '/users'
      expect(User.count).to eq 0
    end

    it 'user puts duplicated info' do
      User.create(first_name: 'Bruce', last_name: 'Wayne', email: 'Taylor@gmail.com', password: 'darkness')

      expect(User.count).to eq 1
      visit '/'
      click_on 'Sign Up'
      fill_in 'First name', with: 'Taylor'
      fill_in 'Last name', with: 'Moore'
      fill_in 'Email', with: 'Taylor@gmail.com'
      fill_in 'Password', with: 'what'
      fill_in 'Password confirmation', with: 'what'
      click_on 'Create Account'

      expect(current_path).to eq '/users'
      expect(User.count).to eq 1
    end

  end

end
