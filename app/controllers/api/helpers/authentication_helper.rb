module AuthenticationHelper
  AUTHCOOKIE = :authentication_payload

  def sign_in(user)
    user.generate_new_token

    # NOTE: We take a couple of measures here to improve
    # the security of storing the user's authentication token
    # on the web front-end. First, we use JWT to sign our auth
    # payload; this gives us some assurance that the payload can
    # not be tampered with and retransmitted successfully. We
    # also transmit our payload via an HTTP-only cookie. This
    # provides assurance that the payload cannot be leveraged
    # in an XSS vulerability exploit.
    cookies[AUTHCOOKIE] =  {
      value: JSONWebTokenService.encode({
        email: user.email,
        token: user.authentication_token
      }),
      httponly: true,
      path: "/",
      expires: 24.hours.from_now
    }
  end

  def sign_out(user)
    user.update(authentication_token: nil)
    cookies.delete(AUTHCOOKIE, path: "/")
  end

  def current_user
    @current_user
  end

  def authenticate!
    auth_token = headers["Authorization"]

    if auth_token && (auth_payload = JSONWebTokenService.decode(auth_token))
      data = auth_payload[0]
      user = User.find_by(authentication_token: data["token"], email: data["email"])

      if user
        @current_user = user
      else
        unauthorized!
      end
    else
      unauthorized!
    end
  end

  def unauthorized!
    error!("Unauthorized", 401)
  end
end
