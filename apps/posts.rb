require 'sequel'

module Posts
  DB = Sequel.connect("postgres://127.0.0.1:5432/lollar_codes_development")

  unless DB[:posts] 
    DB.create_table :posts do
      primary_key :post_id
      String :title
      Text :body
    end
  end
end
