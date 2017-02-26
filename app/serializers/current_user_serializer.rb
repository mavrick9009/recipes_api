class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :type, :email, :first_name, :last_name, :token

  def token
    puts "object"
    puts object.inspect

    JSONWebTokenService.encode({
      email: object.object.email,
      token: object.object.authentication_token
    })
  end
end
