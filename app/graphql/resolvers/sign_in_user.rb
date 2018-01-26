class Resolvers::SignInUser < GraphQL::Function
  argument :signupData, !Types::AuthProviderInputData

  type do
    name 'SignInPayload'

    field :token, !types.String
    field :user, !Types::UserType
  end

  def call(_obj, args, _ctx)
    signup_data = args[:signupData]

    return unless signup_data

    user = User.find_by(email: signup_data[:email])

    # Return unless such user does not exist or the password is wrong
    return unless user
    return unless user.authenticate(signup_data[:password])

    # Build a token

    crypt = ActiveSupport::MessageEncryptor
      .new(Rails.application.secrets.secret_key_base.byteslice(0..31))

    token = crypt.encrypt_and_sign("user-id:#{ user.id  }")

    OpenStruct.new(user: user, token: token)
  end
end
