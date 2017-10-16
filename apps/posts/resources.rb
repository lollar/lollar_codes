require_relative './resources/post'
require_relative './resources/get'

module Posts
  module Resources
    extend self

    def list
      "lrsajbofaj"
    end

    def get(title)
      Get.call(title)
    end

    def post(params)
      Post.call(params)
    end

    def delete(title)
      "... deleting #{title}"
    end
  end
end
