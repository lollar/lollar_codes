require_relative './resources/post'
require_relative './resources/get'
require_relative './resources/list'
require_relative './resources/delete'

module Posts
  module Resources
    extend self

    def list
      List.call
    end

    def get(title)
      Get.call(title)
    end

    def post(params)
      Post.call(params)
    end

    def delete(title)
      Delete.call(title)
    end
  end
end
