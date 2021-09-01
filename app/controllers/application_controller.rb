class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def auth_header_token
    request.headers['Authorization'].split(' ')[1]
 end

 def session_user
      decoded_hash = decoded_token
      if !decoded_hash.empty?
        user_id = decoded_hash[0]["user_id"]
        user = User.find_by(id: user_id)
      end
  end

 def decoded_token
      if auth_header_token
         begin
           JWT.decode(auth_header_token, 'secret',true, algorithm: 'HS256')
         rescue JWT::DecodeError
            []
          end
      end
 end
end