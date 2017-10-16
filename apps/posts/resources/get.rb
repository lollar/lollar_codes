require 'arbitrium'
require_relative '../entity'

module Posts
  module Resources
    class Get
      def self.call(title)
        new(title).call
      end

      def initialize(title)
        @title = title_from_slug(title)
      end

      def call
        post   = find_post
        result = Arbitrium::Result.new(!post.nil?, "Successfully queryed for #{@title}", post.to_json)

        response_hash(result)
      end

      private

      def title_from_slug(title)
        title.gsub('-', ' ')
      end

      def find_post
        Posts::Entity.first(title: @title)
      end

      def response_hash(result)
        { 
          success: result.successful?, 
          message: result.message, 
          object: result.object 
        }
      end
    end
  end
end
