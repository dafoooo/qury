class ApplicationController < ActionController::Base
  before_action :authenticate
  after_action :refresh_token

  private

  def authenticate
    token = cookies.signed[Settings.jwt.cookie.name]
    return unless token

    decoded = Qury::Auth.decode(token)
    return unless decoded

    @current_user = User.find_by(id: decoded["id"])
  end

  def refresh_token
    token = cookies.signed[Settings.jwt.cookie.name]
    return unless token

    decoded = Qury::Auth.decode(token)
    return unless decoded

    if Time.at(decoded["exp"]) - Settings.jwt.refreshable.minutes < Time.now
      decoded.delete("exp")

      cookies.signed[Settings.jwt.cookie.name] = {
        value: Qury::Auth.encode(decoded),
        httponly: Settings.jwt.cookie.httponly,
        secure: Settings.jwt.cookie.secure
      }

      Qury::Auth.revoke(token)
    end
  end
end
