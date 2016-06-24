require 'rails_helper'

RSpec.describe 'User creates account' do

  context 'user can sign up' do
    include Capybara::DSL
    it 'user puts in correct info' do
      visit '/'
      click_on 'Sign Up'
      fill_in 'First name', with: 'Taylor'
      fill_in 'Last name', with:'Moore'
      fill_in 'Email', with: 'Taylor@gmail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq '/users/1'
      expect(User.count).to eq 1
      expect(page).to have_content 'Taylor Moore'
    end

  end

end
