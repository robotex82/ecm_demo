require 'rails_helper'

[I18n.default_locale].each do |locale|
  RSpec.describe 'backend > news > index > sort', type: :feature do
    describe locale do
      include Ecm::News::Backend::Engine.routes.url_helpers

      before(:each) { I18n.locale = locale }

      describe 'columns' do
        let(:user)       { create(:ecm_user_area_user, :authenticable) }
        let(:index_path) { items_path }

        before(:each) do
          sign_in(user)
          visit(index_path)
        end

        it { expect(page.body).to have_link(Ecm::News::Item.human_attribute_name(:locale)) }
        it { expect(page.body).to have_link(Ecm::News::Item.human_attribute_name(:title)) }
        it { expect(page.body).to have_link(Ecm::News::Item.human_attribute_name(:created_at)) }
        it { expect(page.body).to have_link(Ecm::News::Item.human_attribute_name(:updated_at)) }
      end

      describe 'default' do
        let(:item_a)          { create(:ecm_news_item, title: 'a') }
        let(:item_b)          { create(:ecm_news_item, title: 'b') }
        let(:user)            { create(:ecm_user_area_user, :authenticable) }
        let(:index_path)      { items_path }

        before(:each) do
          item_a
          item_b
          sign_in(user)
          visit(index_path)
        end

        it { expect(item_a.title).to appear_before(item_b.title) }
      end

      describe 'sort by title' do
        let(:item_a)          { create(:ecm_news_item, title: 'a') }
        let(:item_b)          { create(:ecm_news_item, title: 'b') }
        let(:user)            { create(:ecm_user_area_user, :authenticable) }
        let(:index_path)      { items_path }

        before(:each) do
          item_b
          item_a
          sign_in(user)
          visit(index_path)
          click_link(Ecm::News::Item.human_attribute_name(:title))
        end

        it { expect(item_a.title).to appear_before(item_b.title) }
      end

      describe 'resort by title' do
        let(:item_a)          { create(:ecm_news_item, title: 'a') }
        let(:item_b)          { create(:ecm_news_item, title: 'b') }
        let(:user)            { create(:ecm_user_area_user, :authenticable) }
        let(:index_path)      { items_path }

        before(:each) do
          item_a
          item_b
          sign_in(user)
          visit(index_path)
          click_link(Ecm::News::Item.human_attribute_name(:title))
          click_link(Ecm::News::Item.human_attribute_name(:title))
        end

        it { expect(item_a.title).to appear_before(item_b.title) }
      end
    end
  end
end if Itsf::Backend.features?(:ransack)