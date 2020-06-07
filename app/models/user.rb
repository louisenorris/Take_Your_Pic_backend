class User < ApplicationRecord
    has_secure_password

    def token
        JWT.encode({ user_id: self.id }, ENV['RAILS_SECRET'])
      end
    
    def self.decode_token(token)
        payload = JWT.decode(token, ENV['RAILS_SECRET'])[0]
        self.find(payload["user_id"])
    end
end
