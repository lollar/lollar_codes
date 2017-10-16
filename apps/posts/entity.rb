require_relative '../posts'

module Posts
  class Entity < Sequel::Model(DB[:posts])
    Posts::Entity.plugin :json_serializer
  end
end
