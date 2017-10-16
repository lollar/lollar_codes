require 'arbitrium'
require_relative '../entity'

module Posts
  module Resources
    class Delete 
      def self.call(title)
        new(title).call
      end

      def initialize(title)
        @title = title_from_slug(title)
      end

      def call
        post = find_post
        return invalid_post_title if post.nil?

        post.delete
        result = Arbitrium::Result.new(true, "Successfully deleted #{@title}")
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
          message: result.message
        }
      end
    end
  end
end
