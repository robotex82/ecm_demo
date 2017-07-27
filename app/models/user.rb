class User < Ecm::UserArea::User
  include Model::Ecm::Rbac::UserConcern
end
