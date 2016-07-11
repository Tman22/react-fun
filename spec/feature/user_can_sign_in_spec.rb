require 'rails_helper'

RSpec.describe 'User can sign in' do
  include Capybara::DSL
  context 'user signs into account' do
    it 'user puts in correct info' do
      User.create(first_name: 'Taylor', last_name: 'Moore', email: 'Taylor@gmail.com', password: 'password')
      expect(User.count).to eq 1
      visit '/'
      fill_in 'Email', with: 'Taylor@gmail.com'
      fill_in 'Password', with: 'password'
      click_on 'Sign In'

      expect(current_path).to eq '/deals'
      expect(page).to have_content 'Taylor Moore'
    end
  end
end
