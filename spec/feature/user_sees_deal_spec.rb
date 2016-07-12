require 'rails_helper'

RSpec.describe 'User signs in and sees deal' do
  include Capybara::DSL
  context 'when signed in user' do
    it 'user sees deal' do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit '/deals'

      expect(page).to have_content 'Bruce Wayne'


    end

  end

end
