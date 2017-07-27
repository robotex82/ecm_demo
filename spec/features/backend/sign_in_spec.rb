require 'rails_helper'

I18n.available_locales.each do |locale|
  RSpec.describe 'Sign in', type: :feature do
    describe locale do
      describe 'success' do
        let(:user)               { create(:ecm_user_area_user, :authenticable) }
        let(:sign_in_path)       { "/#{I18n.locale}/#{I18n.t('routes.ecm_user_area_engine')}/#{I18n.t('routes.user_session')}/new" }
        let(:after_sign_in_path) { "/#{I18n.locale}" }
        let(:submit_button_text) { I18n.t('helpers.submit.user_session.create') }

        before(:each) do
          user
          visit(sign_in_path)
          fill_in 'user_session[email]',    with: user.email
          fill_in 'user_session[password]', with: user.password
          click_button(submit_button_text)
        end

        it { expect(page.status_code).to eq(200) }
        it { expect(current_path).to eq(after_sign_in_path) }
      end
    end
  end
end
