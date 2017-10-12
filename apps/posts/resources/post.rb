require 'arbitrium'
require_relative '../entity'

module Posts
  module Resources
    class Post
      def self.call(params)
        new(params).call
      end

      def initialize(params)
        @title   = params.fetch('title')
        @body    = params.fetch('body')
        @_entity = Posts::Entity.new(title: @title, body: @body)
        @_saved  = false
      end

      def call
        save_entity
        result = Arbitrium::Result.new(@_saved, result_message, @_entity.inspect) 

        response_hash(result)
      end

      private

      def save_entity
        @_saved = @_entity.save
      end

      def result_message
        if @_saved
          "Successfully posted: #{@title}"
        else
          "Failed to post: #{@title}"
        end
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
