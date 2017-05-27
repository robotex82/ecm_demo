Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  localized do
    # No routes for Ecm::Blog yet
    mount Ecm::Contact::Engine,    at: '/contact'
    mount Ecm::Courses::Engine,    at: '/courses'
    mount Ecm::Downloads::Engine,  at: '/downloads'
    mount Ecm::News::Engine,       at: '/news'
    mount Ecm::Pictures::Engine,   at: '/pictures'
    mount Ecm::References::Engine, at: '/references'
    mount Ecm::Sliders::Engine,    at: '/sliders'
    mount Ecm::Tags::Engine,       at: '/tags'
    mount Ecm::UserArea::Engine,   at: '/user-auth'
    mount Ecm::Videos::Engine,     at: '/videos'

    mount Itsf::Backend::Engine, at: '/backend'

    mount Ecm::Blog::Backend::Engine,         at: '/backend/blog'
    mount Ecm::Cms::Backend::Engine,          at: '/backend/cms' # missing
    mount Ecm::Comments::Backend::Engine,     at: '/backend/comments'
    mount Ecm::Courses::Backend::Engine,      at: '/backend/courses'
    mount Ecm::Downloads::Backend::Engine,    at: '/backend/downloads'
    mount Ecm::Links::Backend::Engine,        at: '/backend/links'
    mount Ecm::News::Backend::Engine,         at: '/backend/news'
    mount Ecm::Pictures::Backend::Engine,     at: '/backend/pictures'
    mount Ecm::Rbac::Backend::Engine,         at: '/backend/rbac'
    mount Ecm::References::Backend::Engine,   at: '/backend/references'
    mount Ecm::Staff::Backend::Engine,        at: '/backend/staff'
    mount Ecm::Tags::Backend::Engine,         at: '/backend/tags' # missing
    mount Ecm::TimeTracking::Backend::Engine, at: '/backend/time-tracking' # missing
    mount Ecm::Translations::Backend::Engine, at: '/backend/translations'
    mount Ecm::UserArea::Backend::Engine,     at: '/backend/user-area'
    mount Ecm::Videos::Backend::Engine,       at: '/backend/videos'
    mount Ecm::Youtube::Backend::Engine,      at: '/backend/youtube' # missing

    Ecm::Links::Routing.routes(self)

    mount Ecm::Cms::Engine, at: '/' # This one is greedy and has to go last!
  end
  
  root to: redirect("/#{I18n.locale}")  
end
