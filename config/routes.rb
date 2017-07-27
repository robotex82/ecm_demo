Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Ecm::Blog::Engine,       at: '/'
  mount Ecm::Contact::Engine,    at: '/'
  mount Ecm::Courses::Engine,    at: '/'
  mount Ecm::Downloads::Engine,  at: '/'
  mount Ecm::Links::Engine,      at: '/'
  mount Ecm::News::Engine,       at: '/'
  mount Ecm::Pictures::Engine,   at: '/'
  mount Ecm::References::Engine, at: '/'
  mount Ecm::Sliders::Engine,    at: '/'
  mount Ecm::Staff::Engine,      at: '/'
  mount Ecm::Tags::Engine,       at: '/'
  mount Ecm::UserArea::Engine,   at: '/'
  mount Ecm::Videos::Engine,     at: '/'
  mount Ecm::Youtube::Engine,    at: '/'

  localized do
    mount Itsf::Backend::Engine, at: '/backend'

    mount Ecm::Blog::Backend::Engine,         at: '/backend/ecm-blog-backend-engine'
    mount Ecm::Cms::Backend::Engine,          at: '/backend/ecm-cms-backend-engine' # missing
    mount Ecm::Comments::Backend::Engine,     at: '/backend/ecm-comments-backend-engine'
    mount Ecm::CoreInfo::Backend::Engine,     at: '/backend/ecm-core-info-backend-engine'
    mount Ecm::Courses::Backend::Engine,      at: '/backend/ecm-courses-backend-engine'
    mount Ecm::Downloads::Backend::Engine,    at: '/backend/ecm-downloads-backend-engine'
    mount Ecm::Links::Backend::Engine,        at: '/backend/ecm-links-backend-engine'
    mount Ecm::News::Backend::Engine,         at: '/backend/ecm-news-backend-engine'
    mount Ecm::Pictures::Backend::Engine,     at: '/backend/ecm-pictures-backend-engine'
    mount Ecm::Rbac::Backend::Engine,         at: '/backend/ecm-rbac-backend-engine'
    mount Ecm::References::Backend::Engine,   at: '/backend/ecm-references-backend-engine'
    # mount Ecm::Sliders::Backend::Engine,      at: '/backend/ecm-sliders-backend-engine'
    mount Ecm::Staff::Backend::Engine,        at: '/backend/ecm-staff-backend-engine'
    mount Ecm::Tags::Backend::Engine,         at: '/backend/ecm-tags-backend-engine' # missing
    mount Ecm::TimeTracking::Backend::Engine, at: '/backend/ecm-time-tracking-backend-engine' # missing
    mount Ecm::Translations::Backend::Engine, at: '/backend/ecm-translations-backend-engine'
    mount Ecm::UserArea::Backend::Engine,     at: '/backend/ecm-user-area-backend-engine'
    mount Ecm::Videos::Backend::Engine,       at: '/backend/ecm-videos-backend-engine'
    mount Ecm::Youtube::Backend::Engine,      at: '/backend/ecm-youtube-backend-engine' # missing

    mount Ecm::Cms::Engine, at: '/' # This one is greedy and has to go last!
  end
  
  root to: redirect("/#{I18n.locale}")  
end
