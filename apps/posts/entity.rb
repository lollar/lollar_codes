module Posts
  class Entity
    def initialize(title:, body:)
      @title = title
      @body  = body
    end

    def save
      true
    end
  end
end
