require 'rails_helper'

RSpec.describe Ecm::News::Item, type: :model do
  describe 'published' do
    describe 'default' do
      it { expect(subject).not_to be_published }
    end

    describe 'publishing' do
      before(:each) { subject.toggle_published }

      it { expect(subject).to be_published }
    end
  end
end