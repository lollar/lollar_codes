require 'roda'
require_relative 'lib/lollar_codes'
require_relative 'apps/posts/resources'

class PostsApp < Roda
  plugin :all_verbs

  route do |r|
    r.get String do |title|
      Posts::Resources.get(title)
    end

    r.get do
      Posts::Resources.list
    end

    r.post do
      Posts::Resources.post(r.params)
    end

    r.patch String do |_|
      Responses::NotImplemented.call({})
    end

    r.delete String do |title|
      Posts::Resources.delete(title)
    end
  end
end

class LollarCodes < Roda
  plugin :all_verbs

  route do |r|
    r.root do
      Posts::Resources.list
    end

    r.on 'posts' do
      r.run PostsApp
    end
  end
end

run LollarCodes.freeze.app
