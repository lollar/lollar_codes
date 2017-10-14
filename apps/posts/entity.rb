require_relative '../posts'

module Posts
  class Entity < Sequel::Model(DB[:posts])
  end
end
