require 'rails_helper'

describe "ActiveRecord::Base models" do
  [
    [Ecm::Blog::Post],
    [Ecm::Cms::ContentBox, Ecm::Cms::Folder, Ecm::Cms::Navigation, Ecm::Cms::NavigationItem, Ecm::Cms::Page, Ecm::Cms::Partial, Ecm::Cms::Template],
    [Ecm::Comments::Comment],
    [Ecm::Courses::CourseCategory, Ecm::Courses::Course, Ecm::Courses::CourseDate],
    [Ecm::Downloads::DownloadCategory, Ecm::Downloads::Download],
    [Ecm::Links::Category, Ecm::Links::Link],
    [Ecm::News::Item],
    [Ecm::Pictures::Gallery, Ecm::Pictures::Picture, Ecm::Pictures::AttachedPicture],
    [Ecm::Rbac::Permission, Ecm::Rbac::Role, Ecm::Rbac::RolePermission, Ecm::Rbac::UserRole],
    [Ecm::References::Category, Ecm::References::Reference],
    [Ecm::Sliders::Slider, Ecm::Sliders::Item],
    [Ecm::Staff::BusinessUnit, Ecm::Staff::Organisation, Ecm::Staff::Person, Ecm::Staff::PersonPosition, Ecm::Staff::Position],
    [Ecm::Tags::Tag, Ecm::Tags::Tagging],
    [Ecm::TimeTracking::Entry, Ecm::TimeTracking::EntryType, Ecm::TimeTracking::TrackerCalculationSchema],
    [Ecm::Translations::Translation],
    [Ecm::UserArea::User],
    [Ecm::Youtube::Category, Ecm::Youtube::Video],
    [Ecm::Videos::Category, Ecm::Videos::Video],
  ].flatten.each do |model|
    describe model do
      it "is an ActiveRecord::Base" do
        expect(ActiveRecord::Base.descendants).to include(model)
      end

      it "is instanciable" do
        instance = model.new
        expect(instance).to be_a(model)
      end

      it "is valid with correct attribute values" do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.gsub( '/', '_'))
        expect(instance.valid?).to be_truthy
      end

      it "is not valid with empty attributes" do
        instance = model.new
        expect(instance.valid?).to be_falsey
      end

      it "saves with valid attributes" do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.gsub( '/', '_'))
        expect(instance.save).to be_truthy
        expect(instance.persisted?).to be_truthy
      end
    end
  end
end
