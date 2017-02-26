# Handles encoding/decoding of signed JWTs.
# http://jwt.io/
class JSONWebTokenService
  # Encodes a secret-key-signed JSON Web Token after
  # decorating its payload with an expiration.
  def self.encode(payload, expiration = 24.hours.from_now)
    payload = payload.dup
    payload["expiration"] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decodes a secret-key-signed JSON Web Token.
  #
  # # Array
  # [
  #   {"data"=>"test"}, # payload
  #   {"typ"=>"JWT", "alg"=>"none"} # header
  # ]
  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  end
end
