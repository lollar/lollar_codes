require 'roda'
require_relative 'lib/lollar_codes'

class Posts < Roda
  plugin :all_verbs

  route do |r|
    r.get do
      Posts::Resources.list
    end

    r.get String do |title|
      Posts::Resources.get(title)
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
      #r.run Posts
      Responses::NotImplemented.call({})
    end
  end
end

run LollarCodes.freeze.app
