module Posts
  module Resources
    extend self

    def list
      "list of posts"
    end

    def get(title)
      "single post with #{title}"
    end

    def post(params)
      "posted #{params}"
    end

    def delete(title)
      "... deleting #{title}"
    end
  end
end
