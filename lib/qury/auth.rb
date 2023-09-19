require "jwt"

class Qury::Auth
  def self.encode(payload, exp = Settings.jwt.exp.hours.from_now.to_i)
    payload[:exp] = exp

    JWT.encode(
      payload,
      Settings.jwt.secret_key,
      Settings.jwt.algorithm
    )
  end

  def self.decode(token)
    decoded = JWT.decode(
      token,
      Settings.jwt.secret_key,
      true,
      {algorithm: Settings.jwt.algorithm}
    )[0]

    HashWithIndifferentAccess.new(decoded)
  rescue JWT::ExpiredSignature, JWT::DecodeError
    nil
  end

  def self.revoke(token)
    token_key = "denied::#{token}"
    $redis.set(token_key, 1, ex: Settings.jwt.exp.hours.to_i)
  end

  def self.revoked?(token)
    token_key = "denied::#{token}"
    $redis.get(token_key).present?
  end
end
