class User
  include Mongoid::Document

  field :title, type: String, localize: true
end
