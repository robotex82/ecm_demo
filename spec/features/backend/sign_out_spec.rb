require 'rails_helper'

I18n.available_locales.each do |locale|
  RSpec.describe 'Sign out', type: :feature do
    describe locale do
      include Ecm::UserArea::Engine.routes.url_helpers

      before(:each) { I18n.locale = locale }
      describe 'success' do
        let(:user)                { create(:ecm_user_area_user, :authenticable) }
        let(:profile_path)        { "/#{I18n.locale}/user-auth/user" }
        let(:profile_path)        { current_user_path }
        let(:after_sign_out_path) { "/#{I18n.locale}" }
        let(:sign_out_link_text)  { I18n.t('ecm.user_area.users.base.show.sign_out') }

        before(:each) do
          sign_in(user)
          visit(profile_path)
          click_link(sign_out_link_text)
        end

        it { expect(page.status_code).to eq(200) }
        it { expect(current_path).to eq(after_sign_out_path) }
      end
    end
  end
end
