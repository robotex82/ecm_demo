require 'rails_helper'

[I18n.default_locale].each do |locale|
  RSpec.describe 'backend > news > index > publish', type: :feature do

    describe locale do
      include Ecm::News::Backend::Engine.routes.url_helpers
      
      before(:each) { I18n.locale = locale }

      let(:item)            { create(:ecm_news_item, published_at: nil) }
      let(:user)            { create(:ecm_user_area_user, :authenticable) }
      let(:index_path)      { items_path }
      let(:button_text)     { I18n.t('acts_as_published.actions.publish') }
      let(:button)          { find(:xpath, "//a[span[text()='#{button_text}']]") }
      let(:resource_label)  { item.try_all(*Itsf::Backend::Configuration.resource_title_methods) }
      let(:success_message) { I18n.t('acts_as_published.notices.published', name: resource_label) }

      before(:each) do
        user
        item
        sign_in(user)
        visit(index_path)
      end

      describe 'persistence changes' do
        it { expect{ button.click }.to change{ item.reload; item.published }.from(false).to(true) }
      end
      
      describe 'basic function' do
        before(:each) { button.click }
        
        it { expect(page.body).to have_text(success_message) }
        it { item.reload; expect(item).to be_published }
        it { item.reload; expect(item.published_at).not_to be_nil }
      end
      
    end
  end
end
