require 'arbitrium'
require_relative '../entity'

module Posts
  module Resources
    class List
      def self.call
        new.call
      end

      def initialize
        @posts = Posts::Entity.all
      end

      def call
        result = Arbitrium::Result.new(!@posts.empty?, "Found #{@posts.count} posts", @posts.to_json)

        response_hash(result)
      end

      private

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
